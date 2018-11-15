From: otavio.salvador@ossystems.com.br (Otavio Salvador)
Date: Thu, 15 Nov 2018 15:03:01 -0200
Subject: [OE-core] [PATCH] u-boot: Add mkenvimage tool
In-Reply-To: <CA+chaQd+_55SeR-61zi4DOU8iTyac=w-tEkBDJJvQb-3OvC8iA@mail.gmail.com>
References: <20181115040043.9326-1-abrodkin@synopsys.com>
 <CAMKF1sq3P7XVX9JrqQj8QXhntJWfAM8LY1GFpaCDr3rbDxpgnw@mail.gmail.com>
 <2c011907-e4f6-2b16-e0b8-714db476130e@denx.de>
 <804b3db998a4d9efa0e9f8f649ea9741274be094.camel@synopsys.com>
 <20181115092758.GA1430@jama>
 <104a73697f5072fc3abcf7d9cce47e95ca2e8c12.camel@synopsys.com>
 <CA+chaQd+_55SeR-61zi4DOU8iTyac=w-tEkBDJJvQb-3OvC8iA@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAP9ODKpzrh7-98eiEOOnbH+ASd4-Nt2=jErA_7dJi=7eZFYeag@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Nov 15, 2018@9:35 AM Martin Jansa <martin.jansa@gmail.com> wrote:
> yes fw-utils is similar, but has different dependencies and builds slightly differently.

fw-utils use the machine setup to find the default environment to use,
so it is indeed machine specific.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750
