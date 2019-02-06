public with sharing class WarehouseCalloutService {

    private static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';
    
    // complete this method to make the callout (using @future) to the
    // REST endpoint and update equipment on hand.
    @future(Callout=true)
    public static void runWarehouseEquipmentSync(){
        List<Product2> products = new List<Product2> ();
        Http h = new Http ();
        HttpRequest req = new HttpRequest ();
        req.setEndpoint(WAREHOUSE_URL);
        req.setMethod('GET');
        HttpResponse res = h.send(req);
        
        if (res.getStatusCode() == 200) {
            List<object> equipment = (List<object>) json.deserializeUntyped(res.getBody());
            for (Object iterator : equipment) {
                Map<String, Object> mapProduct = (Map<String, Object>) iterator;
                Product2 product = new Product2 ();
                product.Name = (String)mapProduct.get('name');
                product.Cost__c = (Integer)mapProduct.get('cost');
                product.Current_Inventory__c = (Integer)mapProduct.get('quantity');
                product.Maintenance_Cycle__c = (Integer)mapProduct.get('maintenanceperiod');
                product.Replacement_Part__c = (Boolean)mapProduct.get('replacement');
                product.Lifespan_Months__c = (Integer)mapProduct.get('lifespan');
                product.Warehouse_SKU__c = (String)mapProduct.get('sku');
                product.ProductCode = (String)mapProduct.get('_id');
                products.add(product);
            }
            if (products.size() > 0) 
                upsert products;
            system.debug('insertedProducts' + products);
        }
    }
		
    public static integer add (integer num1, integer num2) {
        integer sum = num1 + num2;
        return sum;
    }
    
    public integer multiply (integer num1, integer num2) {
        return num1 * num2;
    }
}