--destiny draw
local s,id=getid()
function s.initial_effect(c)
	--skill
	aux.addpredrawskillprocedure(c,1,false,s.flipcon,s.flipop)
	if not s.global_check then
		s.global_check=true
		s[0]=nil
		s[1]=nil
		s[2]=0
		s[3]=0
		local ge1=effect.createeffect(c)
		ge1:settype(effect_type_field+effect_type_continuous)
		ge1:setcode(event_adjust)
		ge1:setoperation(s.checkop)
		duel.registereffect(ge1,0)
	end
end
function s.checkop(e,tp,eg,ep,ev,re,r,rp)
	if not s[tp] then s[tp]=duel.getlp(tp) end
	if s[tp]>duel.getlp(tp) then
		s[2+tp]=s[2+tp]+(s[tp]-duel.getlp(tp))
		s[tp]=duel.getlp(tp)
	end
end
function s.flipcon(e,tp,eg,ep,ev,re,r,rp)
	--condition
	return duel.getcurrentchain()==0 and tp==duel.getturnplayer() and duel.getfieldgroupcount(tp,location_deck,0)>0
		and duel.getdrawcount(tp)>0 
		and duel.isexistingmatchingcard(s.thfilter,tp,location_deck,0,1,nil)
		and s[2+tp]>=2000
end
function s.thfilter(c)
	return c:isabletohand()
end
function s.flipop(e,tp,eg,ep,ev,re,r,rp)
	--ask if you want to activate the skill or not
	if not duel.selectyesno(tp,aux.stringid(id,0)) then return end
	--draw replace
	local dt=duel.getdrawcount(tp)
	if dt~=0 then
		_replace_count=0
		_replace_max=dt
		local e1=effect.createeffect(e:gethandler())
		e1:settype(effect_type_field)
		e1:setproperty(effect_flag_player_target)
		e1:setcode(effect_draw_count)
		e1:settargetrange(1,0)
		e1:setreset(reset_phase+phase_draw)
		e1:setvalue(0)
		duel.registereffect(e1,tp)
	end
	duel.hint(hint_skill_flip,tp,id|(1<<32))
	duel.hint(hint_card,tp,id)
	duel.hint(hint_selectmsg,tp,hintmsg_atohand)
	local g=duel.selectmatchingcard(tp,s.thfilter,tp,location_deck,0,1,1,nil)
	if #g~=0 then
		if duel.sendtohand(g,nil,reason_draw)~=0 then
			duel.hint(hint_skill_flip,tp,id|(2<<32))
			s[2+tp]=0
		end
		duel.confirmcards(1-tp,g)
	end
end


