Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEE4606A31A
	for <linux-snps-arc@archiver.kernel.org>; Sun, 22 Nov 2026 23:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4Fghm+aU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bASGs+Qw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Y4OcflPxWj4wZbpZLPAaHi7m0DsjOZyr/1nL+ujVVzU=; b=4Fghm+aUYf4MTUaU75vHjdYFVH
	wZP13hWClgKnEIFOCeTpl5mEEEhpA7UknbfDI0O5LjyViiMM7Q8NKUqSmgx6ajSqHc46VPGiE7niE
	a+cT5OirCYJR2lnzFt8lh0rMHxcO45sMRr3Z18P+vw1UWZXga/9BHAyol4L3S0UAFBM0hOgIgJhXT
	2Sl7V/L+cLBCsqvS8eQri9bTc3ix6r5nB523ATkGj+z5ARteOZIrpfAsBI2pPAKPdKVVGvBbZ7+qY
	WivUqfMksUhFEJ+300ov3gue7UILk5lEojnOd9Os6FkrRDG9jxz9n2Rqncz1YLGmJWO6QQcsbLc/p
	8aqAMYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGlh-00000001t2p-222y;
	Sun, 22 Nov 2026 23:14:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVGlf-00000001t2j-2nii
	for linux-snps-arc@lists.infradead.org;
	Sun, 22 Nov 2026 23:14:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D98042B86;
	Sun, 22 Nov 2026 23:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE601F000C4;
	Sun, 22 Nov 2026 23:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795389282;
	bh=n6jI5G6DqCpJM42Zlj/GMbutWdG4wQmfv30cYJ9hj7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bASGs+QwQUOe+UApfbt2guv9gC96J1c+oLJZ5ZIf5zFYc9+IJPbVpkAtYmWM6gyVy
	 EqRqJE3ILo8Dqv7h6X8HApjEZDBvPxundAiQTyreM+/Jqm/DIY8pBBAoIAHko1gg/2
	 1pIs0UkebZjDgj9RHDhGtur1C97spX4IzUc8Q2fiKd2IgOIcNb9Zu6dWEREbsEh/gp
	 AFGj6sWue4HBmSU/R4KBnVcPQQ/zJZn3NswO8iTNysOyBCEPLP3GTu5b3N5uIrdtOa
	 cJM9as3l5ICTdbVNNy9QYwaXn2Xy0Aep/dLWeeO+3maDC6h1NOgZQnUI2GY8sqiDr9
	 wKb3bAmZjA9mg==
Message-ID: <e96c9d87-53e6-4e82-9502-40e86bac3edc@kernel.org>
Date: Sun, 22 Nov 2026 15:14:41 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next:master 8956/10560] main.c:undefined reference to
 `__st_r13_to_r15'
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Vineet Gupta <vgupta@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
References: <awDriH64LFbN0dkI@rli9-mobl>
 <5d49465f-8584-4e75-8973-9fbf326bce58@app.fastmail.com>
Content-Language: en-US
From: Vineet Gupta <vgupta@kernel.org>
In-Reply-To: <5d49465f-8584-4e75-8973-9fbf326bce58@app.fastmail.com>
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/21/26 02:18, Arnd Bergmann wrote:
> On Sat, Nov 21, 2026, at 01:53, kernel test robot wrote:
>> tree:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
>> master
>> head:   909ef7a9a30fa139e69e555e3606680f5cca7726
>> commit: 86a4eab2bd8313fec6e54742e3ea187b65b86b07 [8956/10560] ARC: stop
>> linking libgcc
>> config: arc-randconfig-2000-20261120
>> (https://download.01.org/0day-ci/archive/20261121/20261121004452.TskH9STt-lkp@intel.com/config)
>> compiler: arc-linux-gcc (GCC) 9.5.0
>> reproduce (this is a W=1 build):
>> (https://download.01.org/0day-ci/archive/20261121/20261121004452.TskH9STt-lkp@intel.com/reproduce)
>>
>> If you fix the issue in a separate patch/commit (i.e. not just a new version of
>> the same patch/commit), kindly add following tags
>> | Reported-by: kernel test robot <lkp@intel.com>
>> | Closes: https://lore.kernel.org/r/20261121004452.TskH9STt-lkp@intel.com/
>>
>> All errors (new ones prefixed by >>):
>>
>>     arc-linux-ld: init/main.o: in function `__traceiter_initcall_finish':
>>>> main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>>>> arc-linux-ld: main.c:(.text+0x90): undefined reference to `__st_r13_to_r15'
>>>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
>>>> arc-linux-ld: main.c:(.text+0xba): undefined reference to `__ld_r13_to_r15_ret'
> I've managed to reproduce this, but only with gcc-12 and older,
> not gcc-13 and up.

Thanks I was trying to do this as well, but couldn't since I didn't have 
an older toolchain handy.


>   I also found a workaround, but I'm not sure if this
> is a good idea or not:
>
> --- a/arch/arc/Makefile
> +++ b/arch/arc/Makefile
> @@ -9,7 +9,7 @@ ifeq ($(CROSS_COMPILE),)
>   CROSS_COMPILE := $(call cc-cross-prefix, arc-linux- arceb-linux- arc-linux-gnu-)
>   endif
>   
> -cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -mswape -D__linux__
> +cflags-y       += -fno-common -pipe -fno-builtin -mmedium-calls -mswape -mno-millicode -D__linux__

I thik this is the right fix.
Ideally this is only needed for OPTIMIZE_FOR_SIZE, let me send a v2.

>   tune-mcpu-def-$(CONFIG_ISA_ARCOMPACT)  := -mcpu=arc700
>   tune-mcpu-def-$(CONFIG_ISA_ARCV2)      := -mcpu=hs38
>
> The alternative of course is to include the libgcc file that includes the
> millicode helpers.
>
> I also came across the "-fno-builtin", which seems like a bad idea because
> it prevents a number of optimizations. I could get it to build without the
> argument using two oneline changes, but that doesn't mean this is correct
> or complete:

I don't recall the history behind this is, seems like its been since 
since th eoriginal port.
I can do a follow up cleanup.

Thx,
-Vineet

>
> --- a/arch/arc/include/asm/bitops.h
> +++ b/arch/arc/include/asm/bitops.h
> @@ -143,7 +143,7 @@ static inline __attribute__ ((const)) unsigned long __fls(unsigned long x)
>    * ffs = Find First Set in word (LSB to MSB)
>    * @result: [1-32], 0 if all 0's
>    */
> -static inline __attribute__ ((const)) int ffs(unsigned int x)
> +static inline __attribute__ ((const)) int ffs(int x)
>   {
>          int n;
>   
> a/arch/arc/kernel/traps.c
> +++ b/arch/arc/kernel/traps.c
> @@ -156,4 +156,5 @@ void do_insterror_or_kprobe(unsigned long address, struct pt_regs *regs)
>   void abort(void)
>   {
>          __asm__ __volatile__("trap_s  5\n");
> +       unreachable();
>   }
>
>       Arnd


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
