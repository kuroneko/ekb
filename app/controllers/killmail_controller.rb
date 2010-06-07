require 'eve_killmail_parser'

class KillmailController < ApplicationController
  def index
    @killmail = ''
    render 'post'
  end

  def post
    @killmail = params[:killmail]
    km = nil
    begin
      km = Eve::Killmail::Parser.new(@killmail)
    rescue
      # exceptions in the parser. probably a crap killmail.
      km = nil
    end
    if km != nil then
      # it worked!
      kill = Kill.new
      kill.killtime = Time.parse(km.date)
      logger.info "Killmail date: #{km.date}"
      logger.info "Parsed Date: #{kill.killtime}"
      # find the pilot, and update his details.
      kill.victim_pilot = Pilot.find_or_create(km.victim.name, km.victim.corporation)
      kill.victim_pilot.update_membership(kill.killtime, km.victim.corporation, km.victim.alliance)
      
      # now bind the actual killmail alliance and corp.
      kill.victim_alliance = nil
      if km.victim.alliance then
        kill.victim_alliance = Alliance.find_or_create(km.victim.alliance)
      end
      kill.victim_corporation = Corporation.find_or_create(km.victim.corporation)
      
      # generate the list of attackers
      km.attackers.each do |a|
        corp = Corporation.find_or_create(a.corporation)
        attacker = Attacker.create(
          :kill => kill,
          :corporation => corp,
          :damage_done => a.damage_done,
          :final_blow => a.final_blow);
        unless a.object then
          attacker.pilot = Pilot.find_or_create(a.name, a.corporation)
          attacker.pilot.update_membership(kill.killtime, a.corporation, a.alliance)
        end
        if a.alliance != nil then
          attacker.alliance = Alliance.find_or_create(a.alliance)
        end
        attacker.save!
        if attacker.final_blow? then
          kill.finalblow_pilot = attacker.pilot
          kill.finalblow_corporation = attacker.corporation
          kill.finalblow_alliance = attacker.alliance
        end
      end
      
      if kill.save then
        # redirect to the kill.
        flash[:notice] = 'Successfully Parsed Killmail'
        redirect_to :controller => :kill, :action => :show, :id => kill.id
      else
        flash.now[:notice] = "<ul>#{kill.errors.map{|attr,msg| "<li>#{attr} - #{msg}</li  >"}}</ul>"
        
        render
      end
    else
      flash.now[:notice] = "Error parsing killmail."
      render      
    end
  end
end
