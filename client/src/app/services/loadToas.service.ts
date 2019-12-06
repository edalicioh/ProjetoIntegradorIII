import { Injectable } from '@angular/core';
import { LoadingController, ToastController } from '@ionic/angular';

@Injectable({
  providedIn: 'root'
})
export class LoadToasService {

constructor(
    private loadingCtrl: LoadingController,
    private toastCtrl: ToastController,
) { }

async presentLoading() {
  let loading = await this.loadingCtrl.create({ message: 'Aguarde...' });
  return loading.present();
}
dismissLoading() {
  return this.loadingCtrl.dismiss()
}

async presentToast(message: string) {
  const toast = await this.toastCtrl.create({ message, duration: 2000 });
  toast.present();
}

}
