import { Injectable } from '@angular/core';

@Injectable({ providedIn: 'root' })
export class PortfolioService {
  constructor() {}

  getProfile() {
    return {
      name: 'Your Name',
      title: 'Computer Science Student',
      bio: 'Passionate about web development'
    };
  }
}
