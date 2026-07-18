import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-navbar',
  standalone: true,
  imports: [CommonModule],
  template: `<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top shadow-sm">
    <div class="container-lg">
      <a class="navbar-brand fw-bold gradient-text" href="#home">My Portfolio</a>
      <button class="navbar-toggler" type="button" (click)="toggleMenu()"><span class="navbar-toggler-icon"></span></button>
      <div class="collapse navbar-collapse" [class.show]="menuOpen" id="navbarNav">
        <ul class="navbar-nav ms-auto gap-3">
          <li class="nav-item"><a class="nav-link" href="#profile" (click)="closeMenu()">Profile</a></li>
          <li class="nav-item"><a class="nav-link" href="#assignments" (click)="closeMenu()">Assignments</a></li>
          <li class="nav-item"><a class="nav-link" href="#activities" (click)="closeMenu()">Activities</a></li>
          <li class="nav-item"><a class="nav-link" href="#skills" (click)="closeMenu()">Skills</a></li>
          <li class="nav-item"><a class="nav-link" href="#projects" (click)="closeMenu()">Projects</a></li>
        </ul>
      </div>
    </div>
  </nav>`,
  styles: [`.nav-link { font-weight: 500; transition: all 0.3s ease; position: relative; }
    .nav-link::after { content: ''; position: absolute; bottom: 0; left: 0; width: 0; height: 2px; background: linear-gradient(135deg, #6366f1, #ec4899); transition: width 0.3s; }
    .nav-link:hover::after { width: 100%; }`]
})
export class NavbarComponent {
  menuOpen = false;
  toggleMenu() { this.menuOpen = !this.menuOpen; }
  closeMenu() { this.menuOpen = false; }
}
