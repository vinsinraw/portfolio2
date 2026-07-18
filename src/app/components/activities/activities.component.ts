import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-activities',
  standalone: true,
  imports: [CommonModule],
  template: `<section id="activities" class="activities-section">
    <div class="container-lg">
      <h2 class="section-title" data-aos="fade-up">Activities & Achievements</h2>
      <div class="timeline">
        <div class="timeline-item" *ngFor="let a of activities; let i = index" [attr.data-aos]="'fade-up'" [attr.data-aos-delay]="i * 100">
          <div class="marker">{{a.icon}}</div>
          <div class="content">
            <h3>{{a.title}}</h3>
            <p>{{a.description}}</p>
            <small>{{a.date}}</small>
          </div>
        </div>
      </div>
    </div>
  </section>`,
  styles: [`.activities-section { padding: 80px 20px; background: linear-gradient(135deg, #f8fafc, #f1f5f9); }
    .timeline { position: relative; padding: 20px 0; }
    .timeline::before { content: ''; position: absolute; left: 50%; width: 3px; height: 100%; background: linear-gradient(180deg, #6366f1, #ec4899); }
    .timeline-item { margin-bottom: 50px; display: flex; gap: 30px; align-items: center; }
    .marker { width: 60px; height: 60px; background: linear-gradient(135deg, #6366f1, #ec4899); border-radius: 50%; display: flex; align-items: center; justify-content: center; color: white; font-size: 28px; border: 4px solid white; z-index: 2; }
    .content { background: white; padding: 25px; border-radius: 12px; flex: 1; }
    .content h3 { font-weight: 700; margin-bottom: 10px; }
    .content p { color: var(--text-light); margin-bottom: 10px; }
    .content small { color: var(--primary-color); font-weight: 600; }
    @media (max-width: 768px) { .timeline::before { left: 0; } .timeline-item { flex-direction: column; gap: 20px; } }`]
})
export class ActivitiesComponent {
  activities = [
    { id: 1, title: 'Hackathon Winner', description: 'Won first prize for IoT solution', date: 'Mar 2024', icon: '🏆' },
    { id: 2, title: 'Tech Speaker', description: 'Talk on Web Development', date: 'Feb 2024', icon: '🎤' },
    { id: 3, title: 'Open Source', description: 'Contributed to projects', date: 'Jan 2024', icon: '💻' }
  ];
}
