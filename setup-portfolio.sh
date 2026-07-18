#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}════════════════════════════════════════${NC}"
echo -e "${BLUE}  Angular Student Portfolio Setup${NC}"
echo -e "${BLUE}════════════════════════════════════════${NC}\n"

# Create directories
echo -e "${BLUE}[1/25] Creating directory structure...${NC}"
mkdir -p .github/workflows
mkdir -p src/app/components/{navbar,profile,assignments,activities,skills,projects,footer}
mkdir -p src/app/services
mkdir -p src/assets/images
echo -e "${GREEN}✓ Directories created${NC}\n"

# .gitignore
echo -e "${BLUE}[2/25] Creating .gitignore...${NC}"
cat > .gitignore << 'EOF'
# Compiled output
/dist
/tmp
/out-tsc
/bazel-out

# Node
/node_modules
npm-debug.log
yarn-error.log

# IDEs
.idea/
.vscode/*
!.vscode/settings.json
*.sublime-workspace

# Angular
/.angular/cache
.sass-cache/

# Misc
.DS_Store
Thumbs.db
EOF
echo -e "${GREEN}✓ .gitignore created${NC}\n"

# package.json
echo -e "${BLUE}[3/25] Creating package.json...${NC}"
cat > package.json << 'EOF'
{
  "name": "student-portfolio",
  "version": "1.0.0",
  "description": "Dynamic Student Portfolio built with Angular",
  "scripts": {
    "ng": "ng",
    "start": "ng serve",
    "build": "ng build --configuration production",
    "build-gh-pages": "ng build --configuration production --base-href=/portfolio2/",
    "test": "ng test",
    "lint": "ng lint"
  },
  "private": true,
  "dependencies": {
    "@angular/animations": "^17.0.0",
    "@angular/common": "^17.0.0",
    "@angular/compiler": "^17.0.0",
    "@angular/core": "^17.0.0",
    "@angular/forms": "^17.0.0",
    "@angular/platform-browser": "^17.0.0",
    "@angular/platform-browser-dynamic": "^17.0.0",
    "@angular/router": "^17.0.0",
    "rxjs": "~7.8.0",
    "tslib": "^2.3.0",
    "zone.js": "~0.14.2",
    "bootstrap": "^5.3.0",
    "aos": "^2.3.4"
  },
  "devDependencies": {
    "@angular-devkit/build-angular": "^17.0.0",
    "@angular/cli": "^17.0.0",
    "@angular/compiler-cli": "^17.0.0",
    "@types/node": "^20.0.0",
    "typescript": "~5.2.2"
  }
}
EOF
echo -e "${GREEN}✓ package.json created${NC}\n"

# angular.json
echo -e "${BLUE}[4/25] Creating angular.json...${NC}"
cat > angular.json << 'EOF'
{
  "$schema": "./node_modules/@angular/cli/lib/config/schema.json",
  "version": 1,
  "newProjectRoot": "projects",
  "projects": {
    "student-portfolio": {
      "projectType": "application",
      "root": "",
      "sourceRoot": "src",
      "prefix": "app",
      "architect": {
        "build": {
          "builder": "@angular-devkit/build-angular:browser",
          "options": {
            "outputPath": "dist/student-portfolio",
            "index": "src/index.html",
            "main": "src/main.ts",
            "polyfills": ["zone.js"],
            "tsConfig": "tsconfig.app.json",
            "inlineStyleLanguage": "scss",
            "assets": ["src/favicon.ico", "src/assets"],
            "styles": ["src/styles.scss", "node_modules/bootstrap/dist/css/bootstrap.min.css", "node_modules/aos/dist/aos.css"],
            "scripts": ["node_modules/bootstrap/dist/js/bootstrap.bundle.min.js", "node_modules/aos/dist/aos.js"]
          },
          "configurations": {
            "production": {
              "budgets": [{"type": "initial", "maximumWarning": "500kb", "maximumError": "1mb"}],
              "outputHashing": "all"
            }
          }
        },
        "serve": {
          "builder": "@angular-devkit/build-angular:dev-server",
          "configurations": {
            "production": {"browserTarget": "student-portfolio:build:production"},
            "development": {"browserTarget": "student-portfolio:build:development"}
          },
          "defaultConfiguration": "development"
        }
      }
    }
  }
}
EOF
echo -e "${GREEN}✓ angular.json created${NC}\n"

# tsconfig.json
echo -e "${BLUE}[5/25] Creating tsconfig.json...${NC}"
cat > tsconfig.json << 'EOF'
{
  "compileOnSave": false,
  "compilerOptions": {
    "baseUrl": "./",
    "outDir": "./dist/out-tsc",
    "forceConsistentCasingInFileNames": true,
    "strict": true,
    "noImplicitAny": true,
    "strictNullChecks": true,
    "noImplicitReturns": true,
    "experimentalDecorators": true,
    "moduleResolution": "node",
    "importHelpers": true,
    "target": "ES2022",
    "module": "ES2022",
    "lib": ["ES2022", "dom"]
  }
}
EOF
echo -e "${GREEN}✓ tsconfig.json created${NC}\n"

# tsconfig.app.json
echo -e "${BLUE}[6/25] Creating tsconfig.app.json...${NC}"
cat > tsconfig.app.json << 'EOF'
{
  "extends": "./tsconfig.json",
  "compilerOptions": {
    "outDir": "./out-tsc/app"
  },
  "files": ["src/main.ts"],
  "include": ["src/**/*.d.ts"]
}
EOF
echo -e "${GREEN}✓ tsconfig.app.json created${NC}\n"

# GitHub Actions Workflow
echo -e "${BLUE}[7/25] Creating GitHub Actions workflow...${NC}"
cat > .github/workflows/deploy.yml << 'EOF'
name: Build and Deploy to GitHub Pages
on:
  push:
    branches: [ main ]
jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@v4
    - uses: actions/setup-node@v4
      with:
        node-version: '18'
        cache: 'npm'
    - run: npm ci
    - run: npm run build-gh-pages
    - uses: peaceiris/actions-gh-pages@v3
      with:
        github_token: ${{ secrets.GITHUB_TOKEN }}
        publish_dir: ./dist/student-portfolio
EOF
echo -e "${GREEN}✓ GitHub Actions workflow created${NC}\n"

# src/main.ts
echo -e "${BLUE}[8/25] Creating src/main.ts...${NC}"
cat > src/main.ts << 'EOF'
import { bootstrapApplication } from '@angular/platform-browser';
import { provideAnimations } from '@angular/platform-browser/animations';
import { AppComponent } from './app/app.component';

bootstrapApplication(AppComponent, {
  providers: [provideAnimations()]
}).catch(err => console.error(err));
EOF
echo -e "${GREEN}✓ src/main.ts created${NC}\n"

# src/index.html
echo -e "${BLUE}[9/25] Creating src/index.html...${NC}"
cat > src/index.html << 'EOF'
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>Student Portfolio</title>
  <base href="/">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="Dynamic student portfolio showcasing assignments, activities, skills, and projects">
  <link rel="icon" type="image/x-icon" href="favicon.ico">
</head>
<body>
  <app-root></app-root>
</body>
</html>
EOF
echo -e "${GREEN}✓ src/index.html created${NC}\n"

# src/styles.scss
echo -e "${BLUE}[10/25] Creating src/styles.scss...${NC}"
cat > src/styles.scss << 'EOF'
:root {
  --primary-color: #6366f1;
  --secondary-color: #ec4899;
  --accent-color: #3b82f6;
  --text-dark: #0f172a;
  --text-light: #64748b;
}

* { margin: 0; padding: 0; box-sizing: border-box; }

html { scroll-behavior: smooth; }

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: var(--text-dark);
  background-color: #fff;
  line-height: 1.6;
}

.section-title {
  font-size: 2.5rem;
  font-weight: 700;
  margin-bottom: 40px;
  text-align: center;
  color: var(--text-dark);
}

.gradient-text {
  background: linear-gradient(135deg, var(--primary-color), var(--secondary-color));
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
}

.btn {
  border-radius: 8px;
  padding: 10px 24px;
  font-weight: 600;
  transition: all 0.3s ease;
  border: none;
  cursor: pointer;
}

.btn-primary {
  background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
  color: white;
}

.btn-primary:hover {
  transform: translateY(-2px);
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
  color: white;
}

.card {
  border-radius: 12px;
  transition: all 0.3s ease;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.card:hover {
  transform: translateY(-4px);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
}

@media (max-width: 768px) {
  .section-title { font-size: 2rem; }
}
EOF
echo -e "${GREEN}✓ src/styles.scss created${NC}\n"

# app.component.ts
echo -e "${BLUE}[11/25] Creating app.component.ts...${NC}"
cat > src/app/app.component.ts << 'EOF'
import { Component, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NavbarComponent } from './components/navbar/navbar.component';
import { ProfileComponent } from './components/profile/profile.component';
import { AssignmentsComponent } from './components/assignments/assignments.component';
import { ActivitiesComponent } from './components/activities/activities.component';
import { SkillsComponent } from './components/skills/skills.component';
import { ProjectsComponent } from './components/projects/projects.component';
import { FooterComponent } from './components/footer/footer.component';

declare var AOS: any;

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, NavbarComponent, ProfileComponent, AssignmentsComponent, ActivitiesComponent, SkillsComponent, ProjectsComponent, FooterComponent],
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})
export class AppComponent implements OnInit {
  ngOnInit() {
    if (typeof AOS !== 'undefined') {
      AOS.init({ duration: 1000, once: false, offset: 100 });
    }
  }
}
EOF
echo -e "${GREEN}✓ app.component.ts created${NC}\n"

# app.component.html
echo -e "${BLUE}[12/25] Creating app.component.html...${NC}"
cat > src/app/app.component.html << 'EOF'
<app-navbar></app-navbar>
<app-profile></app-profile>
<app-assignments></app-assignments>
<app-activities></app-activities>
<app-skills></app-skills>
<app-projects></app-projects>
<app-footer></app-footer>
EOF
echo -e "${GREEN}✓ app.component.html created${NC}\n"

# app.component.scss
echo -e "${BLUE}[13/25] Creating app.component.scss...${NC}"
cat > src/app/app.component.scss << 'EOF'
:host { display: block; }
EOF
echo -e "${GREEN}✓ app.component.scss created${NC}\n"

# navbar.component.ts
echo -e "${BLUE}[14/25] Creating navbar component...${NC}"
cat > src/app/components/navbar/navbar.component.ts << 'EOF'
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
EOF
echo -e "${GREEN}✓ navbar component created${NC}\n"

# profile.component.ts
echo -e "${BLUE}[15/25] Creating profile component...${NC}"
cat > src/app/components/profile/profile.component.ts << 'EOF'
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
          <h1 class="profile-name">Your Name</h1>
          <h2 class="profile-title gradient-text">Computer Science Student</h2>
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
EOF
echo -e "${GREEN}✓ profile component created${NC}\n"

# assignments.component.ts
echo -e "${BLUE}[16/25] Creating assignments component...${NC}"
cat > src/app/components/assignments/assignments.component.ts << 'EOF'
import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-assignments',
  standalone: true,
  imports: [CommonModule],
  template: `<section id="assignments" class="assignments-section">
    <div class="container-lg">
      <h2 class="section-title" data-aos="fade-up">Academic Assignments</h2>
      <div class="row">
        <div class="col-lg-4 col-md-6 mb-4" *ngFor="let a of assignments; let i = index" [attr.data-aos]="'fade-up'" [attr.data-aos-delay]="i * 100">
          <div class="card h-100">
            <div class="card-header"><span class="badge bg-primary">{{a.grade}}</span><span>{{a.date}}</span></div>
            <div class="card-body"><h5 class="card-title">{{a.title}}</h5><p>{{a.description}}</p>
              <div><span class="tech" *ngFor="let t of a.tech">{{t}}</span></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>`,
  styles: [`.assignments-section { padding: 80px 20px; background: white; }
    .card-header { background: linear-gradient(135deg, #6366f1, #3b82f6); color: white; padding: 15px; display: flex; justify-content: space-between; }
    .tech { display: inline-block; background: #f0f4ff; color: #6366f1; padding: 4px 12px; border-radius: 20px; font-size: 0.75rem; margin-right: 5px; }`]
})
export class AssignmentsComponent {
  assignments = [
    { id: 1, title: 'Data Structures', description: 'Implemented DSA with Java', date: 'Sep 2024', grade: 'A+', tech: ['Java', 'Algorithms'] },
    { id: 2, title: 'Web Development', description: 'Built e-commerce with Angular', date: 'Aug 2024', grade: 'A', tech: ['Angular', 'Node.js'] },
    { id: 3, title: 'Database Design', description: 'Hospital management system', date: 'Jul 2024', grade: 'A+', tech: ['SQL', 'MySQL'] }
  ];
}
EOF
echo -e "${GREEN}✓ assignments component created${NC}\n"

# activities.component.ts
echo -e "${BLUE}[17/25] Creating activities component...${NC}"
cat > src/app/components/activities/activities.component.ts << 'EOF'
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
EOF
echo -e "${GREEN}✓ activities component created${NC}\n"

# skills.component.ts
echo -e "${BLUE}[18/25] Creating skills component...${NC}"
cat > src/app/components/skills/skills.component.ts << 'EOF'
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
EOF
echo -e "${GREEN}✓ skills component created${NC}\n"

# projects.component.ts
echo -e "${BLUE}[19/25] Creating projects component...${NC}"
cat > src/app/components/projects/projects.component.ts << 'EOF'
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
EOF
echo -e "${GREEN}✓ projects component created${NC}\n"

# footer.component.ts
echo -e "${BLUE}[20/25] Creating footer component...${NC}"
cat > src/app/components/footer/footer.component.ts << 'EOF'
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
EOF
echo -e "${GREEN}✓ footer component created${NC}\n"

# portfolio.service.ts
echo -e "${BLUE}[21/25] Creating portfolio service...${NC}"
cat > src/app/services/portfolio.service.ts << 'EOF'
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
EOF
echo -e "${GREEN}✓ portfolio service created${NC}\n"

# README.md
echo -e "${BLUE}[22/25] Creating README.md...${NC}"
cat > README.md << 'EOF'
# Student Portfolio - Angular App

A dynamic, modern Angular portfolio application with smooth scroll animations, responsive design, and GitHub Pages deployment.

## Features
- 📸 Student profile showcase
- 🎯 Navigation menu
- ✨ Smooth scroll animations
- 📱 Fully responsive
- 🔗 Social media links
- 🚀 GitHub Pages ready

## Installation

```bash
npm install
```

## Development

```bash
npm start
```

## Build & Deploy

```bash
npm run build-gh-pages
```

Visit `https://vinsinraw.github.io/portfolio2/`

## Customization

Edit components in `src/app/components/` to customize your portfolio with your own:
- Profile information
- Assignments
- Activities
- Skills
- Projects
- Social links

## Technologies

- Angular 17+
- TypeScript
- Bootstrap 5
- SCSS
- AOS (Animate On Scroll)

## License

MIT
EOF
echo -e "${GREEN}✓ README.md created${NC}\n"

# README_SETUP.md
echo -e "${BLUE}[23/25] Creating README_SETUP.md...${NC}"
cat > README_SETUP.md << 'EOF'
# Setup & Customization Guide

## Quick Start After Setup

1. **Install Dependencies**
   ```bash
   npm install
   ```

2. **Start Dev Server**
   ```bash
   npm start
   ```

3. **Visit** http://localhost:4200/

## Customization

### Update Profile
Edit `src/app/components/profile/profile.component.ts`:
- Change "Your Name" to your name
- Update title and bio
- Change profile photo URL

### Update Social Links
Edit `src/app/components/footer/footer.component.ts`:
- Add your LinkedIn URL
- Add your GitHub URL
- Add other social profiles

### Add Assignments
Edit `src/app/components/assignments/assignments.component.ts` - update the `assignments` array

### Add Activities
Edit `src/app/components/activities/activities.component.ts` - update the `activities` array

### Add Skills
Edit `src/app/components/skills/skills.component.ts` - update skill categories and levels

### Add Projects
Edit `src/app/components/projects/projects.component.ts` - update the `projects` array

## Deployment

```bash
npm run build-gh-pages
npx angular-cli-ghpages --dir=dist/student-portfolio
```

Or use GitHub Actions - it's already configured in `.github/workflows/deploy.yml`

Push to GitHub and it will auto-deploy!
EOF
echo -e "${GREEN}✓ README_SETUP.md created${NC}\n"

# Create favicon placeholder
echo -e "${BLUE}[24/25] Creating favicon placeholder...${NC}"
touch src/favicon.ico
echo -e "${GREEN}✓ favicon.ico created${NC}\n"

echo -e "${BLUE}[25/25] Finalizing...${NC}\n"

echo -e "${GREEN}════════════════════════════════════════${NC}"
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo -e "${GREEN}════════════════════════════════════════${NC}\n"

echo -e "${BLUE}📁 Project Structure Created:${NC}"
echo -e "✓ All directories"
echo -e "✓ Configuration files (angular.json, tsconfig.json, package.json)"
echo -e "✓ 7 Components (Navbar, Profile, Assignments, Activities, Skills, Projects, Footer)"
echo -e "✓ Global styles (styles.scss)"
echo -e "✓ Main app files (main.ts, index.html, app.component.*)"
echo -e "✓ Service (portfolio.service.ts)"
echo -e "✓ GitHub Actions workflow"
echo -e "✓ Documentation (README.md, README_SETUP.md)\n"

echo -e "${BLUE}🚀 Next Steps:${NC}"
echo -e "1. ${GREEN}npm install${NC} - Install all dependencies"
echo -e "2. ${GREEN}npm start${NC} - Start development server"
echo -e "3. ${GREEN}Visit http://localhost:4200${NC}"
echo -e "4. ${GREEN}Customize your portfolio${NC}"
echo -e "5. ${GREEN}Push to GitHub${NC}"
echo -e "6. ${GREEN}GitHub Actions will auto-deploy to GitHub Pages${NC}\n"

echo -e "${BLUE}📚 Customization Files:${NC}"
echo -e "• Profile: ${GREEN}src/app/components/profile/profile.component.ts${NC}"
echo -e "• Footer/Social: ${GREEN}src/app/components/footer/footer.component.ts${NC}"
echo -e "• Assignments: ${GREEN}src/app/components/assignments/assignments.component.ts${NC}"
echo -e "• Activities: ${GREEN}src/app/components/activities/activities.component.ts${NC}"
echo -e "• Skills: ${GREEN}src/app/components/skills/skills.component.ts${NC}"
echo -e "• Projects: ${GREEN}src/app/components/projects/projects.component.ts${NC}\n"

echo -e "${BLUE}📖 Read the guides:${NC}"
echo -e "• ${GREEN}README.md${NC} - Project overview"
echo -e "• ${GREEN}README_SETUP.md${NC} - Detailed customization guide\n"

echo -e "${GREEN}Happy coding! 🎉${NC}"
