--Yusei
local s,id=GetID()
function s.initial_effect(c)
	aux.AddSkillProcedure(c,1,false,s.flipcon,s.flipop,100000)

	

end
--Extra add
Debug.AddCard(21065189,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)

--Main monsters Add
Debug.AddCard(32295838,0,0,LOCATION_DECK,0,POS_FACEDOWN)


--Hack Draw
function s.flipcon(e,tp,eg,ep,ev,re,r,rp)

	--condition
	
	return Duel.GetCurrentChain()==0 and (Duel.GetTurnPlayer()==tp or Duel.GetTurnPlayer()==1-tp)
end


function s.flipop(e,tp,eg,ep,ev,re,r,rp)
	
	local a = Duel.SelectMatchingCard(tp,s.filter1,tp,LOCATION_HAND,0,1,1,nil)
	if #a~=0 then
		Duel.SendtoDeck(a,nil,0,REASON_EFFECT)
		local b = Duel.SelectMatchingCard(tp,s.filter2,tp,LOCATION_DECK,0,1,1,nill)
		Duel.SendtoHand(b,nil,REASON_DRAW+REASON_EFFECT)
	end
	
	
end


function s.filter1(c)
	return c:IsAbleToDeck()
end

function s.filter2(c)
	return c:IsAbleToHand()
end















