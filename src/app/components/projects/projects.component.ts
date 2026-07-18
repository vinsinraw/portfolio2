import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-projects',
  standalone: true,
  imports: [CommonModule],
  template: `<section id="projects" class="projects-section">
    <div class="container-lg">
      <h2 class="section-title" data-aos="fade-up">Personal Projects</h2>
      <div class="row">
        <div class="col-lg-4 col-md-6 mb-4" *ngFor="let p of projects; let i = index" [attr.data-aos]="'zoom-in'" [attr.data-aos-delay]="i * 100">
          <div class="card h-100">
            <div class="project-image">
              <img [src]="p.image" [alt]="p.title">
            </div>
            <div class="card-body d-flex flex-column">
              <h5 class="card-title">{{p.title}}</h5>
              <p class="card-text flex-grow-1">{{p.description}}</p>
              <div>
                <span class="badge bg-light text-primary" *ngFor="let t of p.tech">{{t}}</span>
              </div>
              <div class="mt-3">
                <a href="#" target="_blank" class="btn btn-sm btn-primary">Live</a>
                <a href="#" target="_blank" class="btn btn-sm btn-outline-primary ms-2">Code</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>`,
  styles: [`.projects-section { padding: 80px 20px; background: linear-gradient(135deg, #f8fafc, #f1f5f9); }
    .project-image { width: 100%; height: 200px; overflow: hidden; background: #e2e8f0; }
    .project-image img { width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s; }
    .card:hover .project-image img { transform: scale(1.1); }`]
})
export class ProjectsComponent {
  projects = [
    { id: 1, title: 'E-Commerce', description: 'Full-stack platform with Angular & Node.js', image: 'https://via.placeholder.com/350x200?text=E-Commerce', tech: ['Angular', 'Node.js', 'MongoDB'] },
    { id: 2, title: 'Task Manager', description: 'Real-time task management app', image: 'https://via.placeholder.com/350x200?text=Task+Manager', tech: ['Angular', 'Firebase'] },
    { id: 3, title: 'Weather App', description: 'Real-time weather with OpenWeatherMap API', image: 'https://via.placeholder.com/350x200?text=Weather', tech: ['Angular', 'API'] },
    { id: 4, title: 'Blog Platform', description: 'Full blogging platform with comments', image: 'https://via.placeholder.com/350x200?text=Blog', tech: ['React', 'Node.js'] },
    { id: 5, title: 'Chat App', description: 'Real-time chat with WebSocket', image: 'https://via.placeholder.com/350x200?text=Chat', tech: ['Angular', 'Socket.io'] },
    { id: 6, title: 'Portfolio', description: 'Modern portfolio with animations', image: 'https://via.placeholder.com/350x200?text=Portfolio', tech: ['Angular', 'SCSS'] }
  ];
}
