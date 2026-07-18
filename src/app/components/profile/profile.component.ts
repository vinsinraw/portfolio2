import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-profile',
  standalone: true,
  imports: [CommonModule],
  template: `<section id="profile" class="profile-section">
    <div class="container-lg">
      <div class="row align-items-center" data-aos="fade-up">
        <div class="col-md-4 text-center mb-4 mb-md-0">
          <div class="profile-image-wrapper" data-aos="zoom-in" data-aos-delay="200">
            <img src="https://via.placeholder.com/300?text=Profile+Photo" alt="Profile" class="profile-image">
            <div class="profile-badge">Student</div>
          </div>
        </div>
        <div class="col-md-8" data-aos="slide-left" data-aos-delay="300">
          <h1 class="profile-name">Vinod Rawat</h1>
          <h2 class="profile-title gradient-text">Full-Stack Developer</h2>
          <p class="profile-bio">Welcome to my portfolio! I'm passionate about web development and software engineering. This portfolio showcases my academic work and personal projects.</p>
          <div class="profile-stats">
            <div class="stat-item" data-aos="fade-up" data-aos-delay="400"><h3>25+</h3><p>Projects</p></div>
            <div class="stat-item" data-aos="fade-up" data-aos-delay="500"><h3>15+</h3><p>Assignments</p></div>
            <div class="stat-item" data-aos="fade-up" data-aos-delay="600"><h3>10</h3><p>Skills</p></div>
          </div>
          <button class="btn btn-primary btn-lg mt-4">Download Resume</button>
        </div>
      </div>
    </div>
  </section>`,
  styles: [`.profile-section { padding: 100px 20px; background: linear-gradient(135deg, #f8fafc, #f1f5f9); min-height: 100vh; display: flex; align-items: center; }
    .profile-image { width: 300px; height: 300px; border-radius: 20px; box-shadow: 0 20px 40px rgba(0,0,0,0.15); border: 5px solid white; }
    .profile-name { font-size: 3rem; font-weight: 800; margin-bottom: 10px; }
    .profile-title { font-size: 1.75rem; margin-bottom: 20px; }
    .profile-bio { font-size: 1.1rem; color: var(--text-light); line-height: 1.8; margin-bottom: 30px; }
    .profile-stats { display: grid; grid-template-columns: repeat(auto-fit, minmax(120px, 1fr)); gap: 20px; margin-bottom: 30px; }
    .stat-item { background: white; padding: 20px; border-radius: 12px; text-align: center; }
    .stat-item h3 { font-size: 2rem; font-weight: 700; background: linear-gradient(135deg, #6366f1, #ec4899); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }`]
})
export class ProfileComponent {}
