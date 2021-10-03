--Revolver
local s,id=GetID()
function s.initial_effect(c)
	aux.AddSkillProcedure(c,1,false,s.flipcon,s.flipop,100000)

	

end
--Extra add
Debug.AddCard(92892239,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(27548199,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(6247535,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(98630720,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(31833038,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(68987122,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(85289965,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(67288539,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(5821478,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(22593417,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(66403530,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(72529749,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(29296344,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(73341839,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(49725936,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(95372220,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(739444,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(12023931,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(15627227,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(23732205,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(59537380,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(36768783,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(66015185,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(13143275,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(73539069,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)
Debug.AddCard(86148577,0,0,LOCATION_EXTRA,0,POS_FACEDOWN)


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















