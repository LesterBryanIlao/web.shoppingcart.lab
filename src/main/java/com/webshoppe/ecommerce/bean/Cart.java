package com.webshoppe.ecommerce.bean;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Cart {
	private Map<String, CartItem> items;

	public Cart() {
		items = new HashMap<>();
	}

	public int countItems() {
		return items.size();
	}

	public void add(CartItem item) {
		if (item == null) {
			throw new IllegalArgumentException("Cart item cannot be null");
		}

		String id = item.getId().trim();

		if (items.containsKey(id)) {
			items.get(id).addQuantity();

		} else {
			items.put(id, item);
		}
	}

	public void remove(String id) {
		CartItem item = items.get(id.trim());
		if (item == null) {
			throw new RuntimeException("Item not found");
		}
		items.remove(id.trim());
	}

	public Map<String, CartItem> getItems() {
		return items;
	}

	public List<CartItem> getItemsAsList() {
		return new ArrayList<>(items.values());
	}

//	public boolean hasItem(CartItem cartItem) {
//		for (CartItem item : getItemsAsList()) {
//			if (item.getId().trim().equals(cartItem.getId().trim())) {
//				return true;
//			}
//		}
//		return false;
//	}

	public BigDecimal getGrandTotal() {
		BigDecimal grandTotal = new BigDecimal(0);
		for (CartItem item : this.getItemsAsList()) {
			grandTotal = grandTotal.add(item.getTotalPrice());
		}
		return grandTotal;
	}

}
