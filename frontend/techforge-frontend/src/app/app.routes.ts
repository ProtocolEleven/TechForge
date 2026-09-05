import { Routes } from '@angular/router';

import { Login } from './features/auth/login/login';
import { Register } from './features/auth/register/register';
import { ProductList } from './features/products/product-list/product-list';


export const routes: Routes = [

    {
        path: 'login',
        component: Login
    },

    {
        path: 'register',
        component: Register
    },

    {
        path: 'products',
        component: ProductList
    },

    {
        path: '',
        redirectTo: 'products',
        pathMatch: 'full'
    },

    {
        path: '**',
        redirectTo: 'products'
    }

];
