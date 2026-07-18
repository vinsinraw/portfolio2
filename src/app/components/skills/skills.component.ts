import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-skills',
  standalone: true,
  imports: [CommonModule],
  template: `<section id="skills" class="skills-section">
    <div class="container-lg">
      <h2 class="section-title" data-aos="fade-up">Technical Skills</h2>
      <div class="row">
        <div class="col-lg-6 mb-5" *ngFor="let cat of categories; let i = index" [attr.data-aos]="'fade-up'" [attr.data-aos-delay]="i * 100">
          <h3>{{cat.name}}</h3>
          <div *ngFor="let skill of cat.skills" class="skill-item">
            <div class="skill-header">
              <span>{{skill.name}}</span>
              <span>{{skill.level}}%</span>
            </div>
            <div class="skill-bar">
              <div class="skill-progress" [style.width.%]="skill.level"></div>
            </div>
          </div>
        </div>
      </div>
      <div class="skills-grid">
        <div class="badge" *ngFor="let s of skills" [attr.data-aos]="'zoom-in'">
          <div class="badge-icon">{{s.icon}}</div>
          <div>{{s.name}}</div>
        </div>
      </div>
    </div>
  </section>`,
  styles: [`.skills-section { padding: 80px 20px; background: white; }
    .skill-item { margin-bottom: 20px; }
    .skill-header { display: flex; justify-content: space-between; margin-bottom: 8px; font-weight: 600; }
    .skill-bar { width: 100%; height: 8px; background: #f0f0f0; border-radius: 10px; overflow: hidden; }
    .skill-progress { height: 100%; background: linear-gradient(90deg, #6366f1, #3b82f6); transition: width 1s ease; }
    .skills-grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(100px, 1fr)); gap: 15px; margin-top: 40px; }
    .badge { background: linear-gradient(135deg, #6366f1, #3b82f6); color: white; padding: 20px; border-radius: 12px; text-align: center; transition: all 0.3s; }
    .badge:hover { transform: translateY(-8px); }
    .badge-icon { font-size: 2rem; margin-bottom: 10px; }`]
})
export class SkillsComponent {
  categories = [
    { name: 'Languages', skills: [
      { name: 'Java', level: 95 },
      { name: 'Python', level: 90 },
      { name: 'TypeScript', level: 92 },
      { name: 'JavaScript', level: 93 }
    ]},
    { name: 'Web Tech', skills: [
      { name: 'Angular', level: 95 },
      { name: 'React', level: 88 },
      { name: 'HTML/CSS', level: 98 },
      { name: 'Node.js', level: 90 }
    ]}
  ];
  skills = [
    { name: 'Java', icon: '☕' },
    { name: 'Python', icon: '🐍' },
    { name: 'JavaScript', icon: '⚡' },
    { name: 'Angular', icon: '⚙️' },
    { name: 'React', icon: '⚛️' },
    { name: 'Node.js', icon: '🏠' },
    { name: 'SQL', icon: '🗄️' },
    { name: 'MongoDB', icon: '🌿' },
    { name: 'Git', icon: '🔄' },
    { name: 'Docker', icon: '🐳' },
    { name: 'AWS', icon: '☁️' },
    { name: 'TypeScript', icon: '📘' }
  ];
}
