import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { TabsPage } from './tabs.page';

const routes: Routes = [
  {
    path: 'pages',
    component: TabsPage,
    children: [
      {
        path: '',
        children: [
          {
            path: 'home',
            loadChildren: () =>
              import('./../pages/home/home.module').then(m => m.HomePageModule)
          },
          {
            path: 'list',
            loadChildren: () =>
              import('./../pages/list/list.module').then(m => m.ListPageModule)
          },
          {
            path: 'perfil',
            loadChildren: () =>
              import('./../pages/config/config.module').then(m => m.ConfigPageModule)
          }
        ]
      },
      {
        path: '',
        redirectTo: 'pages/home',
        pathMatch: 'full'
      }
    ]
  },
  {
    path: '',
    redirectTo: 'pages/home',
    pathMatch: 'full'
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class TabsPageRoutingModule {}
