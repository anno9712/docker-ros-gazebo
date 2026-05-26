# ROS & Gazebo Docker Images

GitHub Actions로 자동 빌드 → Docker Hub 업로드하는 예제입니다.

## 이미지 구성

| 이미지 | Dockerfile | 내용 |
|--------|-----------|------|
| `<username>/ros-jazzy-only` | `.docker/ros-only.dockerfile` | ROS 2 Jazzy만 설치 |
| `<username>/gazebo-harmonic-only` | `.docker/gazebo-only.dockerfile` | Gazebo Harmonic만 설치 |

## 셋업 순서

### 1. Docker Hub 계정 생성
- https://hub.docker.com 에서 계정 생성

### 2. Docker Hub Access Token 발급
1. Docker Hub → Account Settings → Security → **New Access Token**
2. 이름 입력(예: `github-actions`) 후 생성
3. 토큰 값 복사해두기

### 3. GitHub Secrets 등록
GitHub 레포지토리 → Settings → Secrets and variables → Actions → **New repository secret**

| Secret 이름 | 값 |
|------------|---|
| `DOCKERHUB_USERNAME` | Docker Hub 사용자 이름 |
| `DOCKERHUB_TOKEN` | 위에서 발급한 Access Token |

### 4. 이 레포지토리를 본인 GitHub에 push
```bash
git init
git add .
git commit -m "initial commit"
git branch -M main
git remote add origin https://github.com/<YOUR_GITHUB_USERNAME>/<REPO_NAME>.git
git push -u origin main
```

push하면 GitHub Actions가 자동으로 실행되어 Docker Hub에 이미지가 업로드됩니다.

## 결과 확인
- GitHub → Actions 탭에서 빌드 진행 상황 확인
- https://hub.docker.com/u/<username> 에서 이미지 확인
