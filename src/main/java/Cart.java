import java.util.Arrays;

public class Cart {
	public float total_price;
	Item[] items;
	private int item_index = 0;
	
	public Cart(String username, String item_id, float price) {
		super();
		this.items = new Item[25];
		this.total_price = 0;
	}
	
	//adds item to the array
	public void addItem(Item item) {
		items[item_index] = item;
		item_index++;
		this.updateTotalPrice();
	}
	
	//updates cart to include all items in the array
	public void updateCart() {
		for(int i = 0; i < items.length - 1; i++) {
			
		}
	}
	
	public void removeItem(Item item) {
		Arrays.sort(items);
		int index = Arrays.binarySearch(items, item);
		items[index] = items[items.length - 1];
		items[items.length - 1] = null;
		item_index--;
		
	}
	
	public float getTotalPrice() {
		return total_price;
	}
	
	public void updateTotalPrice() {
		for(int i = 0; i < items.length - 1; i++) {
			total_price = total_price + items[i].getPrice();
		}	
	}
	
	
}