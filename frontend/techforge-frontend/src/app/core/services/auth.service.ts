import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Observable } from "rxjs";
import { environment } from "../../../environments/environment";

import { LoginRequest, RegisterRequest, AuthResponse } from "../../shared/models/auth.models";

@Injectable({
    providedIn: 'root'
})

export class AuthService{

    private readonly apiUrl = `${environment.apiUrl}/auth`;

    constructor(private readonly http: HttpClient) {}

    login(request: LoginRequest): Observable<AuthResponse>{
        return this.http.post<AuthResponse>(
            `${this.apiUrl}/login`, request
        );
    }

    register(request: RegisterRequest): Observable<AuthResponse>{
        return this.http.post<AuthResponse>(
            `${this.apiUrl}/register`, request
        );
    }
}