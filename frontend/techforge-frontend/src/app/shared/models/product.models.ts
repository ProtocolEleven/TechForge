export interface Product {
  id: number;
  name: string;
  description: string;
  sku: string;
  price: number;
  stockQuantity: number;
  brand: string;
  category: string;
}

export interface CreateProduct {
  name: string;
  description: string;
  sku: string;
  price: number;
  stockQuantity: number;
  brandId: number;
  categoryId: number;
}

export interface UpdateProduct {
  name: string;
  description: string;
  sku: string;
  price: number;
  stockQuantity: number;
  brandId: number;
  categoryId: number;
}