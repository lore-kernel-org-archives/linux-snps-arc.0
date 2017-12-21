From: arnd@arndb.de (Arnd Bergmann)
Date: Thu, 21 Dec 2017 09:09:58 +0100
Subject: [PATCH 2/2] ARC: handle gcc generated __builtin_trap for older
 compiler
In-Reply-To: <1513810194-8377-3-git-send-email-vgupta@synopsys.com>
References: <1513810194-8377-1-git-send-email-vgupta@synopsys.com>
 <1513810194-8377-3-git-send-email-vgupta@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK8P3a0VkVEYLDwi+tbita+e6jik6uMyJ=foMDLDA8K94w5tNA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Wed, Dec 20, 2017 at 11:49 PM, Vineet Gupta
<Vineet.Gupta1@synopsys.com> wrote:
> ARC gcc prior to GNU 2018.03 release didn't have a target specific
> __builtin_trap() implementation, generating default abort() call.
>
> Implement the abort() call - emulating what newer gcc does for the same,
> as suggested by Arnd.
>
> Signed-off-by: Vineet Gupta <vgupta at synopsys.com>

Acked-by: Arnd Bergmann <arnd at arndb.de>
