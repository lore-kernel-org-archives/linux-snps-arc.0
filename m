From: vineetg76@gmail.com (Vineet Gupta)
Date: Wed, 18 Sep 2019 10:40:32 -0700
Subject: stable backport for dc8635b78cd8669
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <efb68643-3750-e94b-8387-6e4cacb3a82a@gmail.com>
To: linux-snps-arc@lists.infradead.org

Hi Stable team,

Can we please backport dc8635b78cd8669c37e230058d18c33af7451ab1 ("kernel/exit.c:
export abort() to modules")

0-Day kernel test infra reports ARC 4.x.y builds failing after backport of
af1be2e21203867cb958aace ("ARC: handle gcc generated __builtin_trap for older
compiler")

Thx
-Vineet
