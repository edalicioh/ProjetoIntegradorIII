import { Component, OnInit } from '@angular/core';
import { LoadToasService } from 'src/app/services/loadToas.service';
import { AuthService } from 'src/app/services/auth.service';
import { HttpErrorResponse } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-signup',
  templateUrl: './signup.page.html',
  styleUrls: ['./signup.page.scss'],
})
export class SignupPage implements OnInit {

  public exchange : boolean = false
  public email : string  = "edalicio@outlook.co"
  private id 
  public password
  public passwordConf

  constructor(
    private auth : AuthService,
    private LT : LoadToasService,
    private router: Router
  ) { }

  async confirmEmail () {
    await this.LT.presentLoading(); 
    let d = { email : this.email }
    try {
      await this.auth.searchEmail(d).subscribe(
        data => { 
          this.exchange = true
          this.id = data
          this.LT.dismissLoading() 
        },
        (error: HttpErrorResponse) => {
          this.LT.dismissLoading()
          this.LT.presentToast("<b>Erro!</b> Email ou senha incorreos")
        }
      )
    } catch (error) {
      console.log("ERRO->", error);
    }
    
  }

  async upPassword() {
    if (this.password == this.passwordConf && ( this.password != null || this.passwordConf != null ) ) {
      let up = {
        id : this.id,
        password : this.password 
      }
      await this.LT.presentLoading()
      try {
        await this.auth.upPassword(up).subscribe(
          data => {
            this.router.navigate(['pages/home'])
            this.LT.dismissLoading()
          },
        (error: HttpErrorResponse) => {
          this.LT.dismissLoading()
          this.LT.presentToast("<b>Erro!</b> Email ou senha incorreos")
        } )
        
      } catch (error) {
        console.log(error);
      }
    } else {
      await this.LT.dismissLoading()
      this.LT.presentToast("<b>Erro!</b>Senha incorreos")
    }
  }

  ngOnInit() {  }

}
