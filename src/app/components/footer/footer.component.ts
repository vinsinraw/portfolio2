import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-footer',
  standalone: true,
  imports: [CommonModule],
  template: `<footer class="footer">
    <div class="container-lg">
      <div class="social-section" data-aos="fade-up">
        <h3>Connect With Me</h3>
        <div class="social-links">
          <a *ngFor="let link of socialLinks; let i = index" [href]="link.url" target="_blank" [title]="link.name" [attr.data-aos]="'zoom-in'" [attr.data-aos-delay]="i * 50">
            <span>{{link.icon}}</span>
            <span>{{link.name}}</span>
          </a>
        </div>
      </div>
      <div class="footer-content mt-5">
        <div class="row">
          <div class="col-md-4"><h4>About</h4><p>Passionate CS student dedicated to building amazing web apps.</p></div>
          <div class="col-md-4"><h4>Quick Links</h4><ul><li><a href="#profile">Profile</a></li><li><a href="#assignments">Assignments</a></li><li><a href="#skills">Skills</a></li></ul></div>
          <div class="col-md-4"><h4>Contact</h4><ul><li><a href="mailto:email@example.com">📧 Email</a></li><li><a href="tel:+1234567890">📞 Phone</a></li></ul></div>
        </div>
      </div>
      <div class="footer-bottom">
        <p>&copy; 2024 Your Name. All rights reserved.</p>
      </div>
    </div>
  </footer>`,
  styles: [`.footer { background: linear-gradient(135deg, #1e293b, #0f172a); color: white; padding: 60px 20px 30px; margin-top: 80px; }
    .social-section { text-align: center; padding-bottom: 40px; border-bottom: 1px solid rgba(255,255,255,0.1); }
    .social-section h3 { font-size: 1.5rem; font-weight: 700; margin-bottom: 30px; background: linear-gradient(135deg, #6366f1, #ec4899); -webkit-background-clip: text; -webkit-text-fill-color: transparent; }
    .social-links { display: flex; justify-content: center; flex-wrap: wrap; gap: 20px; }
    .social-links a { display: inline-flex; align-items: center; gap: 10px; padding: 12px 20px; background: rgba(255,255,255,0.1); border-radius: 8px; color: white; text-decoration: none; transition: all 0.3s; }
    .social-links a:hover { background: linear-gradient(135deg, #6366f1, #ec4899); transform: translateY(-4px); }
    .footer-content { padding: 40px 0; }
    .footer-content h4 { font-weight: 700; margin-bottom: 15px; }
    .footer-content a { color: rgba(255,255,255,0.7); text-decoration: none; transition: all 0.3s; }
    .footer-content a:hover { color: white; }
    .footer-bottom { text-align: center; padding-top: 30px; border-top: 1px solid rgba(255,255,255,0.1); color: rgba(255,255,255,0.6); }`]
})
export class FooterComponent {
  socialLinks = [
    { name: 'LinkedIn', icon: '💼', url: 'https://linkedin.com/in/yourprofile' },
    { name: 'GitHub', icon: '🐙', url: 'https://github.com/vinsinraw' },
    { name: 'Twitter', icon: '𝕏', url: 'https://twitter.com/yourprofile' },
    { name: 'Email', icon: '📧', url: 'mailto:your.email@example.com' }
  ];
}
