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
