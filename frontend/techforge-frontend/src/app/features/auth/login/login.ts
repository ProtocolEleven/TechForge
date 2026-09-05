import { Component } from '@angular/core';
import { ReactiveFormsModule, FormBuilder,FormGroup, Validators, FormControl } from '@angular/forms';
import { AuthService } from '../../../core/services/auth.service';
import { LoginRequest } from '../../../shared/models/auth.models';
import { validate } from '@angular/forms/signals';

@Component({
  selector: 'app-login',
  imports: [ReactiveFormsModule],
  templateUrl: './login.html',
  styleUrl: './login.scss',
})
export class Login {

  loginForm: FormGroup<{
    email: FormControl<string>;
    password: FormControl<string>
  }>;

  constructor(
    private readonly formBuilder: FormBuilder,
    private readonly authService: AuthService
  ) {
    this.loginForm = this.formBuilder.nonNullable.group({
      email: ['', [Validators.required, Validators.email]],
      password: ['', Validators.required]
  });
  }

  onSubmit(): void{

    if(this.loginForm.invalid){

      this.loginForm.markAllAsTouched();
      return;
    }

    const request: LoginRequest = this.loginForm.getRawValue();

    this.authService.login(request).subscribe({

      next: (response) => {
        console.log("Login Successful:", response);
      },
      error: (error) => {
        console.log("Login Failed:", error);
      }
      
    })
  }
}
