# 주의사항

이 저장소는 [StratosphereLinuxIPS](https://github.com/stratosphereips/StratosphereLinuxIPS)의 원본 프로젝트를 기반으로 하며, 코드 분석 및 커스터마이징 목적으로 포크되었습니다. 원본 프로젝트의 모든 권리는 Stratosphere Laboratory에 있습니다.

---

<h1 align="center">
Slips v1.1.9
</h1>



[![License](https://img.shields.io/badge/license-GPLv2-blue)](./LICENSE)
[![GitHub version](https://img.shields.io/github/v/tag/stratosphereips/StratosphereLinuxIPS?label=version)](https://github.com/stratosphereips/StratosphereLinuxIPS)
![Python](https://img.shields.io/badge/python-3.8-blue)
![GitHub language count](https://img.shields.io/github/languages/count/stratosphereips/StratosphereLinuxIPS)
![GitHub repository size](https://img.shields.io/github/repo-size/stratosphereips/StratosphereLinuxIPS)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/stratosphereips/slips/latest?color=blue&label=docker%20image%20size)
![Docker Pulls](https://img.shields.io/docker/pulls/stratosphereips/slips)

[![GitHub issues](https://img.shields.io/github/issues/stratosphereips/StratosphereLinuxIPS.svg?color=green)](https://GitHub.com/stratosphereips/StratosphereLinuxIPS/issues/)
[![GitHub issues-closed](https://img.shields.io/github/issues-closed/stratosphereips/StratosphereLinuxIPS.svg?color=green)](https://GitHub.com/stratosphereips/StratosphereLinuxIPS/issues?q=is%3Aissue+is%3Aclosed)
[![GitHub open-pull-requests](https://img.shields.io/github/issues-pr-raw/stratosphereips/StratosphereLinuxIPS?color=green&label=open%20PRs)](https://github.com/stratosphereips/StratosphereLinuxIPS/pulls?q=is%3Aopen)
[![GitHub pull-requests closed](https://img.shields.io/github/issues-pr-closed-raw/stratosphereips/StratosphereLinuxIPS?color=green&label=closed%20PRs)](https://github.com/stratosphereips/StratosphereLinuxIPS/pulls?q=is%3Aclosed)
[![GitHub contributors](https://img.shields.io/github/contributors/stratosphereips/StratosphereLinuxIPS?color=orange)](https://GitHub.com/stratosphereips/StratosphereLinuxIPS/contributors/)
![GitHub forks](https://img.shields.io/github/forks/stratosphereips/StratosphereLinuxIPS?color=orange)
![GitHub Org's stars](https://img.shields.io/github/stars/stratosphereips/StratosphereLinuxIPS?color=orange)
[![GitHub watchers](https://img.shields.io/github/watchers/stratosphereips/StratosphereLinuxIPS?color=orange)](https://GitHub.com/stratosphereips/StratosphereLinuxIPS/watchers/)

[![License](https://img.shields.io/badge/Blog-Stratosphere-cyan)](https://www.stratosphereips.org/blog/tag/slips)
[![Discord](https://img.shields.io/discord/761894295376494603?label=&logo=discord&logoColor=ffffff&color=7389D8&labelColor=6A7EC2)](https://discord.gg/zu5HwMFy5C)
![Twitter Follow](https://img.shields.io/twitter/follow/StratosphereIPS?style=social)

<hr>


# 목차

- [소개](#소개)
- [사용법](#사용법)
- [GUI](#그래픽-사용자-인터페이스)
- [요구사항](#요구사항)
- [설치](#설치)
- [설정](#설정)
- [기능](#기능)
- [기여하기](#기여하기)
- [문서](#문서)
- [문제해결](#문제해결)
- [라이선스](#라이선스)
- [크레딧](#크레딧)
- [변경이력](#변경이력)
- [로드맵](#로드맵)
- [데모](#데모)
- [자금지원](#자금지원)


# Slips: 행동 기반 머신러닝 침입 방지 시스템


Slips는 머신러닝을 사용하여 네트워크 트래픽에서 악의적인 행동을 감지하는 강력한 엔드포인트 행동 기반 침입 방지 및 탐지 시스템입니다. Slips는 실시간 네트워크 트래픽, PCAP 파일, Suricata, Zeek/Bro, Argus와 같은 인기 도구의 네트워크 흐름을 분석할 수 있습니다. Slips의 위협 탐지는 악의적인 행동을 감지하도록 훈련된 머신러닝 모델, 40개 이상의 위협 인텔리전스 피드, 전문가 휴리스틱의 조합을 기반으로 합니다. Slips는 악의적인 행동의 증거를 수집하고 충분한 증거가 누적될 때 경고를 트리거하기 위해 광범위하게 훈련된 임계값을 사용합니다.

<img src="https://raw.githubusercontent.com/stratosphereips/StratosphereLinuxIPS/develop/docs/images/slips.gif" width="850px" title="Slips in action.">

---


# 소개
Slips는 엔드포인트용 최초의 무료 행동 기반 머신러닝 IDS/IPS입니다. 2012년 체코 기술 대학교 AIC의 Stratosphere Laboratory에서 Sebastian Garcia에 의해 만들어졌습니다. 목표는 행동 분석을 사용하여 네트워크 공격을 감지하는 머신러닝을 활용하는 로컬 IDS/IPS를 제공하는 것이었습니다.


Slips는 Linux, MacOS, Windows Docker에서 지원됩니다. Slips의 차단 기능은 Linux에서만 지원됩니다.

Slips는 Python 기반이며 실시간 트래픽 캡처 및 PCAP 분석을 위해 [Zeek 네트워크 분석 프레임워크](https://zeek.org/get-zeek/)에 의존합니다. 또한 프로세스 간 통신을 위해 Redis >= 7.0.4에 의존합니다.

---

# 사용법

Slips를 사용하는 가장 좋은 방법은 Docker를 사용하는 것입니다.

#### Linux 및 Windows 호스트
```
docker run --rm -it -p 55000:55000  --cpu-shares "700" --memory="8g" --memory-swap="8g" --net=host --cap-add=NET_ADMIN --name slips stratosphereips/slips:latest
```

```
./slips.py -f dataset/test7-malicious.pcap -o output_dir
```

```
cat output_dir/alerts.log
```

#### MacOS
MacOS에서는 호스트에서 컨테이너의 내부 포트에 접근하려면 --net=host를 사용하지 마세요.

```
docker run --rm -it -p 55000:55000 --platform linux/amd64 --cpu-shares "700" --memory="8g" --memory-swap="8g" --cap-add=NET_ADMIN --name slips stratosphereips/slips_macos_m1:latest
```

```
./slips.py -f dataset/test7-malicious.pcap -o output_dir
```

```
cat output_dir/alerts.log
```


[더 많은 설치 옵션](https://stratospherelinuxips.readthedocs.io/en/develop/installation.html#installation)

[Slips 매개변수에 대한 자세한 설명](https://stratospherelinuxips.readthedocs.io/en/develop/usage.html#slips-parameters)

---


# 그래픽 사용자 인터페이스

Slips 출력을 GUI로 확인하려면 웹 인터페이스나 명령줄 기반 인터페이스인 Kalipso를 사용할 수 있습니다.

##### 웹 인터페이스

    ./webinterface.sh

그런 다음 브라우저에서 ```http://localhost:55000/```로 이동하세요.

<img src="https://raw.githubusercontent.com/stratosphereips/StratosphereLinuxIPS/develop/docs/images/web_interface.png" width="850px">

웹 인터페이스에 대한 자세한 정보는 문서를 확인하세요: https://stratospherelinuxips.readthedocs.io/en/develop/usage.html#the-web-interface


##### Kalipso (CLI-인터페이스)

    ./kalipso.sh

<img src="https://raw.githubusercontent.com/stratosphereips/StratosphereLinuxIPS/develop/docs/images/kalipso.png" width="850px">


For more info about the Kalipso interface, check the docs: https://stratospherelinuxips.readthedocs.io/en/develop/usage.html#kalipso

---


# 요구사항

Slips는 원활한 실행을 위해 Python 3.10.12와 최소 4GB의 RAM이 필요합니다.

---

# 설치

Slips는 다양한 플랫폼에서 실행할 수 있으며, Linux 사용자라면 Docker에서 Slips를 실행하는 것이 가장 쉽고 권장되는 방법입니다.

* [Docker](https://stratospherelinuxips.readthedocs.io/en/develop/installation.html#slips-in-docker)
  * Dockerhub (권장)
    * [Linux 및 Windows 호스트](https://stratospherelinuxips.readthedocs.io/en/develop/installation.html#linux-and-windows-hosts)
    * [MacOS 호스트](https://stratospherelinuxips.readthedocs.io/en/develop/installation.html#macos-hosts)
  * [Docker-compose](https://stratospherelinuxips.readthedocs.io/en/develop/installation.html#running-slips-using-docker-compose)
  * [Dockerfile](https://stratospherelinuxips.readthedocs.io/en/develop/installation.html#building-slips-from-the-dockerfile)
* 네이티브
  * [install.sh 사용](https://stratospherelinuxips.readthedocs.io/en/develop/installation.html#install-slips-using-shell-script)
  * [수동 설치](https://stratospherelinuxips.readthedocs.io/en/develop/installation.html#installing-slips-manually)
* [RPI에서 (베타)](https://stratospherelinuxips.readthedocs.io/en/develop/installation.html#installing-slips-on-a-raspberry-pi)


---


# 설정
Slips는 다양한 모듈과 일반 실행을 위한 사용자 설정이 포함된 [config/slips.yaml](https://github.com/stratosphereips/StratosphereLinuxIPS/blob/develop/config/slips.yaml)을 가지고 있습니다.

* ```time_window_width``` 매개변수를 수정하여 시간 창 너비를 변경할 수 있습니다
* 컴퓨터에서 오가는 공격을 보고 싶다면 분석 방향을 ```all```로 변경할 수 있습니다
* ML 모델을 ```train``` 또는 ```test```할지 지정할 수도 있습니다

* You can enable [popup notifications](https://stratospherelinuxips.readthedocs.io/en/develop/usage.html#popup-notifications) of evidence, enable [blocking](https://stratospherelinuxips.readthedocs.io/en/develop/usage.html#slips-permissions), [plug in your own zeek script](https://stratospherelinuxips.readthedocs.io/en/develop/usage.html#plug-in-a-zeek-script) and more.


[More details about the config file options here]( https://stratospherelinuxips.readthedocs.io/en/develop/usage.html#modifying-the-configuration-file)

---

# 기능
Slips의 주요 기능은:

* **행동 기반 침입 방지**: Slips는 머신러닝을 사용하여 네트워크 트래픽에서 악의적인 행동을 감지하는 강력한 시스템으로 작동합니다.
* **모듈성**: Slips는 Python으로 작성되었으며 네트워크 트래픽에서 특정 탐지를 수행하는 다양한 모듈로 구성되어 있습니다.
* **표적 공격 및 명령 & 제어 탐지**: 네트워크 트래픽에서 표적 공격과 명령 및 제어 채널을 식별하는 데 중점을 둡니다.
* **트래픽 분석 유연성**: Slips는 실시간 네트워크 트래픽, PCAP 파일, Suricata, Zeek/Bro, Argus와 같은 인기 도구의 네트워크 흐름을 분석할 수 있습니다.
* **위협 인텔리전스 업데이트**: Slips는 위협 인텔리전스 파일과 데이터베이스를 지속적으로 업데이트하여 업데이트가 발생할 때 관련 탐지를 제공합니다.
* **외부 플랫폼과의 통합**: Modules in Slips can look up IP addresses on external platforms such as VirusTotal and RiskIQ.
* **그래픽 사용자 인터페이스**: Slips는 탐지를 그래프와 테이블로 표시하는 콘솔 그래픽 사용자 인터페이스(Kalipso)와 웹 인터페이스를 제공합니다.
* **피어투피어(P2P) 모듈**: Slips는 네트워크에서 다른 피어를 찾고 IoC 데이터를 균형 있고 신뢰할 수 있는 방식으로 자동으로 공유하는 복잡한 자동 시스템을 포함합니다. The P2P module can be enabled as needed.
* **Docker Implementation**: Running Slips through Docker on Linux systems is simplified, allowing real-time traffic analysis.
* **Detailed Documentation**: Slips provides detailed documentation guiding users through usage instructions for efficient utilization of its features.
* **Federated learning** Using the feel_project submodule. for more information [check the docs](https://github.com/stratosphereips/feel_project/blob/main/docs/Federated_Learning.md)

---

# 기여하기

We welcome contributions to improve the functionality and features of Slips.

Please read carefully the [contributing guidelines](https://stratospherelinuxips.readthedocs.io/en/develop/contributing.html) for contributing to the development of Slips

You can run Slips and report bugs, make feature requests, and suggest ideas, open a pull request with a solved GitHub issue and new feature, or open a pull request with a new detection module.

The instructions to create a new detection module along with a template [here](https://stratospherelinuxips.readthedocs.io/en/develop/create_new_module.html).

If you are a student, we encourage you to apply for the Google Summer of Code program that we participate in as a hosting organization.

Check [Slips in GSoC2023](https://github.com/stratosphereips/Google-Summer-of-Code-2023) for more information.


You can [join our conversations in Discord](https://discord.gg/zu5HwMFy5C) for questions and discussions.
We appreciate your contributions and thank you for helping to improve Slips!

---

# 문서
[User documentation](https://stratospherelinuxips.readthedocs.io/en/develop/)

[Code docs](https://stratospherelinuxips.readthedocs.io/en/develop/code_documentation.html )

---

# 문제해결

If you can't listen to an interface without sudo, foe example when zeek is throwing the following error:
```bash
fatal error: problem with interface wlan0 (pcap_error: socket: Operation not permitted (pcap_activate))
```

you can adjust zeek capabilities using the following command

```
sudo setcap cap_net_raw,cap_net_admin=eip /<path-to-zeek-bin/zeek
```


---

You can [join our conversations in Discord](https://discord.gg/zu5HwMFy5C) for questions and discussions.

Or email us at
* sebastian.garcia@agents.fel.cvut.cz
* eldraco@gmail.com,
* alyaggomaa@gmail.com

---

# 라이선스

 [GNU General Public License](https://github.com/stratosphereips/StratosphereLinuxIPS/blob/master/LICENCE)

---


# 크레딧

Founder: [Sebastian Garcia](https://github.com/eldraco), sebastian.garcia@agents.fel.cvut.cz, eldraco@gmail.com.

Main authors: [Sebastian Garcia](https://github.com/eldraco), [Alya Gomaa](https://github.com/AlyaGomaa), [Kamila Babayeva](https://github.com/kamilababayeva)

Contributors:

* [Veronica Valeros](https://github.com/verovaleros)
* [Frantisek Strasak](https://github.com/frenky-strasak)
* [Dita Hollmannova](https://github.com/draliii)
* [Ondrej Lukas](https://github.com/ondrej-lukas)
* Elaheh Biglar Beigi
* [Martin Řepa](https://github.com/HappyStoic)
* [arkamar](https://github.com/arkamar)
* [Maria Rigaki](https://github.com/MariaRigaki)
* [Lukas Forst](https://github.com/LukasForst)
* [Daniel Yang](https://github.com/danieltherealyang)

---


# 변경이력

https://github.com/stratosphereips/StratosphereLinuxIPS/blob/develop/CHANGELOG.md


---

# 데모
The following videos contain demos of Slips in action in various events:

- 2022 BlackHat Europe Arsenal, Slips: A Machine-Learning Based, Free-Software, Network Intrusion Prevention System [[web](https://www.blackhat.com/eu-22/arsenal/schedule/index.html#slips-free-software-machine-learning-tool-for-network-intrusion-prevention-system-29599)]
- 2022 BlackHat USA Arsenal, Slips: A Machine-Learning Based, Free-Software, Network Intrusion Prevention System [[web](https://www.blackhat.com/us-22/arsenal/schedule/index.html#slips-free-software-machine-learning-tool-for-network-intrusion-prevention-system-26687)]
- 2021 BlackHat Europe Arsenal, Slips: A Machine-Learning Based, Free-Software, Network Intrusion Prevention System [[slides](https://mega.nz/file/EAIjWA5D#DoYhJknH1hpbqfS2ayVLwA7ewNT50jFQb7S3dVAKPko)] [[web](https://www.blackhat.com/eu-21/arsenal/schedule/#slips-a-machine-learning-based-free-software-network-intrusion-prevention-system-25116)]
- 2021 BlackHat USA Arsenal, Slips: A Machine-Learning Based, Free-Software, Network Intrusion Prevention System [[web](https://www.blackhat.com/us-21/arsenal/schedule/#slips-a-machine-learning-based-free-software-network-intrusion-prevention-system-24105)]
- 2021 BlackHat Asia Arsenal, Slips: A Machine-Learning Based, Free-Software, Network Intrusion Prevention System [[web](https://www.blackhat.com/asia-21/arsenal/schedule/#slips-a-machine-learning-based-free-software-network-intrusion-prevention-system-22576)]
- 2020 Hack In The Box CyberWeek, Android RATs Detection With A Machine Learning-Based Python IDS [[video](https://www.youtube.com/watch?v=wx0V3qWdmyk)]
- 2019 OpenAlt, Fantastic Attacks and How Kalipso can Find Them [[video](https://www.youtube.com/watch?v=p2FL2sECpS0&t=1s)]
- 2016 Ekoparty, Stratosphere IPS. The free machine learning malware detection [[video](https://www.youtube.com/watch?v=IazEdK8R4YI)]

---

# 자금지원
We are grateful for the generous support and funding provided by the following organizations:


- NlNet Foundation, https://nlnet.nl/

This project is funded through [NGI0 Entrust](https://nlnet.nl/entrust), a fund established by [NLnet](https://nlnet.nl) with financial support from the European Commission's [Next Generation Internet](https://ngi.eu) program. Learn more at the [NLnet project page](https://nlnet.nl/project/Iris-P2P).

[<img src="https://nlnet.nl/logo/banner.png" alt="NLnet foundation logo" width="20%" />](https://nlnet.nl)
[<img src="https://nlnet.nl/image/logos/NGI0_tag.svg" alt="NGI Zero Logo" width="20%" />](https://nlnet.nl/entrust)


- Artificial Intelligence Centre at the Czech Technical University in Prague, https://www.aic.fel.cvut.cz/
- Avast, https://www.avast.com/
- CESNET, https://www.cesnet.cz/
- Google Summer of Code (2023, 2024), https://summerofcode.withgoogle.com/

Their funding has played a crucial role in the development and success of this project.
We sincerely appreciate their commitment to advancing technology and their recognition of
the value Slips brings to the community.
