 --[[****************************      .-.                **      `-.. ..-. + +      **      `-''-'' '          **  OpenSource Scripting   **          Team           ** http://sunplusplus.info **                         ****************************This software is provided as free and open source by thestaff of the Sun++ Scripts Project, in accordance with the GPL license. This means we provide the software we have created freely and it has been thoroughly tested to work for the developers, but NO GUARANTEE is made it will work for you as well. Please give credit where credit is due, if modifying,redistributing and/or using this software. Thank you.Sun++ Team, July 2008~End of License AgreementMade by: Recon-- ]]--[[TODO:Missing spell? or what?Some monster say..When calling for a sacrifice:    * Who among you is devoted?    * You there! Step forward! When fulfilling the sacrifice:    * Yogg-Saron, grant me your power!    * Master, a gift for you! When preaching:    * The elements themselves will rise up against the civilized world! Only the faithful will be spared!    * Immortality can be yours. But only if you pledge yourself fully to Yogg-Saron!    * Here on the very borders of his domain. You will experience powers you would never have imagined!    * You have traveled long and risked much to be here. Your devotion shall be rewarded.    * The faithful shall be exalted! But there is more work to be done. We will press on until all of Azeroth lies beneath his shadow! ]]function Jedoga_OnCombat(pUnit, Event)	--pUnit:PlaySoundToSet()	pUnit:SendChatMessage(12, 0, "These are sacred halls! Your intrusion will be met with death.")	pUnit:RegisterEvent("CycloneStrike",7000, 0)	pUnit:RegisterEvent("LightningBolt",14000, 0)	pUnit:RegisterEvent("Thundershock",20000, 0)end	function CycloneStrike (pUnit, Event)	pUnit:FullCastSpellOnTarget(56855,pUnit:GetMainTank())endfunction LightningBolt (pUnit, Event)	pUnit:FullCastSpellOnTarget(56891,pUnit:GetMainTank())end	function Thundershock (pUnit, Event)	pUnit:FullCastSpell(56926)function Jedoga_OnKilledTarget (pUnit, Event)	local Choice=math.random(1, 3)	if Choice==1 then		--pUnit:PlaySoundToSet()		pUnit:SendChatMessage(12, 0,"Glory to Yogg-Saron!")	elseif Choice==2 then			--pUnit:PlaySoundToSet()		pUnit:SendChatMessage(12, 0,"You are unworthy!")	elseif Choice==3 then			--pUnit:PlaySoundToSet()		pUnit:SendChatMessage(12, 0,"Get up! You haven't suffered enough! ")		end		endfunction Jedoga_OnLeaveCombat(pUnit, Event)	pUnit:RemoveEvents()	endfunction Jedoga_OnDied(pUnit, event, player)	--pUnit:PlaySoundToSet()	pUnit:SendChatMessage(12, 0, "Do not expect your sacrilige to go unpunished. ")		pUnit:RemoveEvents()endRegisterUnitEvent(29310, 1, "Jedoga_OnCombat")RegisterUnitEvent(29310, 2, "Jedoga_OnLeaveCombat")RegisterUnitEvent(29310, 3, "Jedoga_OnDied")RegisterUnitEvent(29310, 4, "Jedoga_OnKilledTarget")