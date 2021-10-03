--Magnet Warrior Sigma Minus
Duel.LoadScript("c419.lua")
local s,id=GetID()
function s.initial_effect(c)
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_SINGLE)
	e1:SetCode(EFFECT_CANNOT_SELECT_BATTLE_TARGET)
	e1:SetValue(s.vala)
	c:RegisterEffect(e1)
	--must attack
	local e2=Effect.CreateEffect(c)
	e2:SetType(EFFECT_TYPE_SINGLE)
	e2:SetCode(EFFECT_MUST_ATTACK)
	e2:SetCondition(s.becon)
	c:RegisterEffect(e2)
	local e3=Effect.CreateEffect(c)
	e3:SetType(EFFECT_TYPE_FIELD)
	e3:SetCode(EFFECT_CANNOT_EP)
	e3:SetRange(LOCATION_MZONE)
	e3:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e3:SetTargetRange(1,0)
	e3:SetCondition(s.becon)
	c:RegisterEffect(e3)
	local e4=Effect.CreateEffect(c)
	e4:SetType(EFFECT_TYPE_FIELD)
	e4:SetCode(EFFECT_MUST_BE_ATTACKED)
	e4:SetTargetRange(0,LOCATION_MZONE)
	e4:SetRange(LOCATION_MZONE)
	e4:SetValue(s.atkval)
	e4:SetTarget(s.atktg)
	c:RegisterEffect(e4)
end
function s.vala(e,c)
	return c:IsFaceup() and c:IsType(TYPE_MINUS) and not c:IsType(TYPE_PLUS)
end
function s.atkfilter(c)
	return c:IsFaceup() and c:IsType(TYPE_PLUS)
end
function s.becon(e)
	return e:GetHandler():CanAttack() 
		and Duel.IsExistingMatchingCard(s.atkfilter,e:GetHandlerPlayer(),0,LOCATION_MZONE,1,nil)
end
function s.atktg(e,c)
	return c:IsFaceup() and c:IsType(TYPE_PLUS)
end
function s.atkval(e,c)
	return not c:IsImmuneToEffect(e) and c==e:GetHandler()
end