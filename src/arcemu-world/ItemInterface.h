/*
 * ArcEmu MMORPG Server
 * Copyright (C) 2005-2007 Ascent Team <http://www.ascentemu.com/>
 * Copyright (C) 2008 <http://www.ArcEmu.org/>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */
//safe way to handle arrays in debug mode
#include <array>

#ifndef _ITEMINTERFACE_H
#define _ITEMINTERFACE_H

#define INVALID_BACKPACK_SLOT ((int8)(0xFF)) //In 1.8 client marked wrong slot like this

struct SlotResult
{
	SlotResult() { ContainerSlot = -1, Slot = -1, Result = false; }
	int8 ContainerSlot;
	int16 Slot;
	bool Result;
};


enum CanAffordItem
{
	CAN_AFFORD_ITEM_ERROR_NOT_FOUND				= 0,
	CAN_AFFORD_ITEM_ERROR_SOLD_OUT				= 1,
	CAN_AFFORD_ITEM_ERROR_NOT_ENOUGH_MONEY		= 2,
	CAN_AFFORD_ITEM_ERROR_DOESNT_LIKE_YOU		= 4,
	CAN_AFFORD_ITEM_ERROR_TOO_FAR_AWAY			= 5,
	CAN_AFFORD_ITEM_ERROR_CANT_CARRY_ANY_MORE	= 8,
	CAN_AFFORD_ITEM_ERROR_NOT_REQUIRED_RANK		= 11,
	CAN_AFFORD_ITEM_ERROR_REPUTATION			= 12,
};

class Item;
class Container;
class Player;
class UpdateData;
class ByteBuffer;

// sanity checking
enum AddItemResult
{
	ADD_ITEM_RESULT_ERROR			= 0,
	ADD_ITEM_RESULT_OK				= 1,
	ADD_ITEM_RESULT_DUPLICATED		= 2,
};

class SERVER_DECL ItemInterface
{
private:
	SlotResult result;
	Player *m_pOwner;
	//Item* m_pItems[MAX_INVENTORY_SLOT];
	tr1::array< Item*, MAX_INVENTORY_SLOT> m_pItems;
	//Item* m_pBuyBack[MAX_BUYBACK_SLOT];
	tr1::array< Item*, MAX_BUYBACK_SLOT> m_pBuyBack;

	AddItemResult m_AddItem(Item *item, int8 ContainerSlot, int16 slot);

public:
	friend class ItemIterator;
	ItemInterface( Player *pPlayer );
	~ItemInterface();

	Player *GetOwner() { return m_pOwner; }
	bool IsBagSlot(int16 slot);

	uint32 m_CreateForPlayer(ByteBuffer *data);
	void m_DestroyForPlayer();

	void mLoadItemsFromDatabase(QueryResult * result);
	void mSaveItemsToDatabase(bool first, QueryBuffer * buf);

	Item *GetInventoryItem(int16 slot);
	Item *GetInventoryItem(int8 ContainerSlot, int16 slot);
	int16 GetInventorySlotById(uint32 ID);
	int16 GetInventorySlotByGuid(uint64 guid);
	int16 GetBagSlotByGuid(uint64 guid);
	uint32 GetInventoryItemDisplay(int16 slot)
	{
		Item *it = GetInventoryItem( slot );
		if(it && it->GetProto() )
			return it->GetProto()->DisplayInfoID;
		return 0;
	}

	Item *SafeAddItem(uint32 ItemId, int8 ContainerSlot, int16 slot);
	AddItemResult SafeAddItem(Item *pItem, int8 ContainerSlot, int16 slot);
	Item *SafeRemoveAndRetreiveItemFromSlot(int8 ContainerSlot, int16 slot, bool destroy); //doesnt destroy item from memory
	Item *SafeRemoveAndRetreiveItemByGuid(uint64 guid, bool destroy);
	bool SafeFullRemoveItemFromSlot(int8 ContainerSlot, int16 slot); //destroys item fully
	bool SafeFullRemoveItemByGuid(uint64 guid); //destroys item fully
	AddItemResult AddItemToFreeSlot(Item **item);//!! in case of item merge, item will get deleted !
	AddItemResult AddItemToFreeBankSlot(Item *item);
	
	Item* FindItemLessMax(uint32 itemid, uint32 cnt, bool IncBank);
	uint32 GetItemCount(uint32 itemid, bool IncBank = false);
	uint32 RemoveItemAmt(uint32 id, uint32 amt);
	uint32 RemoveItemAmt_ProtectPointer(uint32 id, uint32 amt, Item** pointer);
	void RemoveAllConjured();
	void BuyItem(ItemPrototype *item, uint32 total_amount, Creature * pVendor);

	uint32 CalculateFreeSlots(ItemPrototype *proto);
	void ReduceItemDurability();

	uint16 LastSearchItemBagSlot(){return result.ContainerSlot;}
	uint16 LastSearchItemSlot(){return result.Slot;}
	SlotResult *LastSearchResult(){return &result;}

	//Searching functions
	SlotResult FindFreeInventorySlot(ItemPrototype *proto);
	SlotResult FindFreeBankSlot(ItemPrototype *proto);
	SlotResult FindAmmoBag();
	int16 FindFreeBackPackSlot();
	int16 FindFreeKeyringSlot();
	int16 FindFreeCurrencySlot();
	int16 FindSpecialBag(Item *item);


	int8 CanEquipItemInSlot(int16 DstInvSlot, int16 slot, ItemPrototype* item, bool ignore_combat = false, bool skip_2h_check = false);
	int8 CanEquipItemInSlot2(int16 DstInvSlot, int16 slot, Item* item, bool ignore_combat = false, bool skip_2h_check = false);
	uint8 CanReceiveItem(ItemPrototype * item, uint32 amount);
	uint8 CanAffordItem(ItemPrototype * item,uint32 amount, Creature * pVendor);
	int16 GetItemSlotByType(uint32 type);
	Item* GetItemByGUID(uint64 itemGuid);


	void BuildInventoryChangeError(Item *SrcItem, Item *DstItem, uint8 Error);
	void SwapItemSlots(int16 srcslot, int16 dstslot);

	int16 GetInternalBankSlotFromPlayer(int16 islot); //converts inventory slots into 0-x numbers

	//buyback stuff
	ARCEMU_INLINE Item* GetBuyBack(int32 slot) 
	{ 
		if(slot >= 0 && slot < MAX_BUYBACK_SLOT)
			return m_pBuyBack[slot];
		else 
			return NULL;
	}
	void AddBuyBackItem(Item* it, uint32 price);
	void RemoveBuyBackItem(uint32 index);
	void EmptyBuyBack();
	bool IsEquipped(uint32 itemid);
	bool IsCategoryEquipped(uint32 category);
	bool CanCustomCategoryEquip(ItemPrototype *newequip);	//heroic - non heroic

	void CheckAreaItems();
   ARCEMU_INLINE bool VerifyBagSlots(int8 ContainerSlot, int16 Slot)
   {
      if( ContainerSlot < -1 || Slot < 0 )
         return false;

      if( ContainerSlot > 0 && (ContainerSlot < INVENTORY_SLOT_BAG_START || ContainerSlot >= INVENTORY_SLOT_BAG_END) )
         return false;

      if( ContainerSlot == -1 && (Slot >= INVENTORY_SLOT_ITEM_END  || Slot <= EQUIPMENT_SLOT_END) )
         return false;
         
      return true;
   }

   ARCEMU_INLINE bool VerifyBagSlotsWithBank(int8 ContainerSlot, int16 Slot)
   {
      if( ContainerSlot < -1 || Slot < 0 )
         return false;

      if( ContainerSlot > 0 && (ContainerSlot < INVENTORY_SLOT_BAG_START || ContainerSlot >= INVENTORY_SLOT_BAG_END) )
         return false;

      if( ContainerSlot == -1 && (Slot >= MAX_INVENTORY_SLOT || Slot <= EQUIPMENT_SLOT_END) )
         return false;

      return true;
   }
    bool AddItemById(uint32 itemid, uint32 count, int32 randomprop);
	int8 CanEquipItem(ItemPrototype *proto, Player *m_owner);
private:
	//we these should be called only when we know for sure that item is actually added. Created this to not duplicate code in multiple place
	ARCEMU_INLINE void EventItemAdd(Item *pItem);
	ARCEMU_INLINE void EventItemRemove(Item *pItem);
};

class ItemIterator
{
	bool m_atEnd;
	bool m_searchInProgress;
	uint32 m_slot;
	uint32 m_containerSlot;
	Container * m_container;
	Item * m_currentItem;
	ItemInterface* m_target;
public:
	ItemIterator(ItemInterface* target) : m_atEnd(false),m_searchInProgress(false),m_slot(0),m_containerSlot(0),m_container(NULL),m_target(target) {}
	~ItemIterator() { if(m_searchInProgress) { EndSearch(); } }

	void BeginSearch()
	{
		// iteminterface doesn't use mutexes, maybe it should :P
		ASSERT(!m_searchInProgress);
		m_atEnd=false;
		m_searchInProgress=true;
		m_container=NULL;
		m_currentItem=NULL;
		m_slot=0;
		Increment();
	}

	void EndSearch()
	{
		// nothing here either
		ASSERT(m_searchInProgress);
		m_atEnd=true;
		m_searchInProgress=false;
	}

	Item* operator*() const
	{
		return m_currentItem;
	}

	Item* operator->() const
	{
		return m_currentItem;
	}

	void Increment()
	{
		if(!m_searchInProgress)
			BeginSearch();

		// are we currently inside a container?
		if(m_container != NULL)
		{
			// loop the container.
			for(; m_containerSlot < m_container->GetProto()->ContainerSlots; ++m_containerSlot)
			{
				m_currentItem = m_container->GetItem(m_containerSlot);
				if(m_currentItem != NULL)
				{
					// increment the counter so we don't get the same item again
					++m_containerSlot;

					// exit
					return;
				}
			}

			// unset this
			m_container=NULL;
		}

		for(; m_slot < MAX_INVENTORY_SLOT; ++m_slot)
		{
			if(m_target->m_pItems[m_slot])
			{
				if(m_target->m_pItems[m_slot]->IsContainer())
				{
					// we are a container :O lets look inside the box!
					m_container = SafeContainerCast(m_target->m_pItems[m_slot]);
					m_containerSlot = 0;

					// clear the pointer up. so we can tell if we found an item or not
					m_currentItem = NULL;

					// increment m_slot so we don't search this container again
					++m_slot;

					// call increment() recursively. this will search the container.
					Increment();

					// jump out so we're not wasting cycles and skipping items
					return;
				}

				// we're not a container, just a regular item
				// set the pointer
				m_currentItem = m_target->m_pItems[m_slot];

				// increment the slot counter so we don't do the same item again
				++m_slot;

				// jump out
				return;
			}
		}

		// if we're here we've searched all items.
		m_atEnd=true;
		m_currentItem=NULL;
	}

	ARCEMU_INLINE Item* Grab() { return m_currentItem; }
	ARCEMU_INLINE bool End() { return m_atEnd; }
};

#endif
