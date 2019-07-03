From: arnd@arndb.de (Arnd Bergmann)
Date: Wed, 3 Jul 2019 20:25:32 +0200
Subject: [PATCH] ARC: hide unused function unw_hdr_alloc
In-Reply-To: <7584cf05-e3f9-7027-a08c-87efbfb0f608@synopsys.com>
References: <20190703133940.1493249-1-arnd@arndb.de>
 <7584cf05-e3f9-7027-a08c-87efbfb0f608@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK8P3a2c49gLLU5BKsty7WCD=6gZbJ0PiJvYfe3SMou=SqUi9Q@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Jul 3, 2019@6:13 PM Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
> On 7/3/19 6:39 AM, Arnd Bergmann wrote:
> > Fixes: bc79c9a72165 ("ARC: dw2 unwind: Reinstante unwinding out of modules")
> > Link: https://kernelci.org/build/id/5d1cae3f59b514300340c132/logs/
> > Cc: stable at vger.kernel.org
> > Signed-off-by: Arnd Bergmann <arnd at arndb.de>
>
> Thx, do you want me to pick this up via arc tree.

Yes, that would be great.

Thanks,

      Arnd
