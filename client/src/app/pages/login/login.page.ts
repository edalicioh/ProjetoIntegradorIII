import { Component, OnInit } from '@angular/core';
import { AuthService } from '../../services/auth.service';
import { LoadToasService } from 'src/app/services/loadToas.service';
import { HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.page.html',
  styleUrls: ['./login.page.scss'],
})
export class LoginPage implements OnInit {

  public email: string
  public password: string

  constructor(
    private auth: AuthService,
    private LT: LoadToasService,
    private router : Router
  ) { }

  ngOnInit() { }

  async login() {
    let user = {
      "email": this.email,
      "password": this.password
    }
    this.LT.presentLoading();
    try {
      await this.auth.login(user).subscribe(
        data => {
          console.log(data)
          this.router.navigate(['pages/home'])
          this.LT.dismissLoading()
        },
        (error: HttpErrorResponse) => {
          console.log(error);
          this.LT.dismissLoading()
          this.LT.presentToast("<b>Erro!</b> Email ou senha incorreos")
        }
      )
    } catch (error) {
      console.log("ERRO->", error);
    }

  }


}
