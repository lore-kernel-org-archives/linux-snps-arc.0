Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1947EB64DA
	for <linux-snps-arc@archiver.kernel.org>; Sat, 24 Jun 2023 14:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q19Ly81xRbqkfrD2qb+Xq8N8jN0RmVj/1/6Qn+lqp4c=; b=EIre77ag/mxKjo
	04ZP8TV4+6FFZ+jQjOBnqAfgJPdRyBNtjGVrRP5y5B8Kv9HmCT9uzmI/X28RpniS6BFx16B9JGXwM
	8dBFfSgQqteVLd0R990q0EvfJeHDVJ3eq4Pv066UZenPiLBf3o7kVBFMEx0eH+I7K4Byv2MhpFA/1
	etid7i8isGCW+ZnCzHKOt5oSVCt+TzZvRxDDl4iVl3RoGCNUzpuciLwK1jyHHXPenVlFFAykdh/Kn
	MmWrprvoe++PH+FFefrBPfCv9bwDGPJg3J84MlN5nAt+796YQT12ZxmxQF0CA9MC8dK4A0lFN2lGv
	0XSp5wKgwJX1iSsbOvlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qD49h-0066KS-2x;
	Sat, 24 Jun 2023 14:22:25 +0000
Received: from new4-smtp.messagingengine.com ([66.111.4.230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qD49d-0066Ig-2L;
	Sat, 24 Jun 2023 14:22:23 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 9D1445801DE;
	Sat, 24 Jun 2023 10:22:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 24 Jun 2023 10:22:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1687616537; x=1687623737; bh=Ih
	z6/bi511oP4d526TPPtM1blBZt4arV1NypQDvLup8=; b=Owr1gNHl98uY/LqghJ
	ew6TAsiUgTWjuGMsxDEW7dPPnLV3e7dQ48EjTdP5xHC8mtn8gOYupnCSHk4hfivP
	2548A0+ELQQlya9a+Jj0JkYOlxNPXvbMtrvZE4ZYuMEg0oeEVRQxH3fZk7dq7fcR
	K2FnnRvxLC2ctHogIIPsu5AzKYi/b1l8LHXlg+nhxQKDQbQ2GgNgOE7o0SLx/lJl
	ZJl/F2RHs+ZN1HfuzBUUYja0J54XdNJ5XYphhB2SZMV3SOmTcHA6JZT0U9/SAmVC
	9c8VJBDM16nnBrphov+n9ifuK0VIrDEcUy1gZSuUHvkasNoYZlMz0wEqqeUYovQg
	985w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687616537; x=1687623737; bh=Ihz6/bi511oP4
	d526TPPtM1blBZt4arV1NypQDvLup8=; b=VK5TgDjVEpiEaunZZwRRAQPsTnjFp
	zkoDEEdhdFioqudleRGZjNuek0JsRnk3YrU4OgaJsTS63QgF8QOtf7vg2z1azqmX
	zbJgS5KJT8RVEJGWIcWXoccJV7DsEUPIM7fQrw314Non4B0AcKCTS2tiu4ftIj8G
	sBy+JyOj8lBXvLnjyDAYLzzz21cS9Rw6GZ1k8qjXXnVcAj+7YV4car/+OJ2Hz1Vy
	XzKWDBO3QquHdDPcc9ZnIK0trCu+0GLImpYfYIOCCwLguVtAkJf4TryNcTfPhMob
	qjIlOfgux2mxV3SnTy++07Z7K6tSNSgFgk6q7BXZ1w+17nZskwCf6fCwA==
X-ME-Sender: <xms:GPyWZCp4xCyzgIT7Kv57_S9Fj_YrOyXXtQi7KxbKTITt5sPxujuEgA>
    <xme:GPyWZAoCSw5-QOKYgYL1kqq0dPmclQVYtInH9cHAwaW4i2eRqwCURn45oRtWD_RQc
    xQUs-Q4Qr9LCBw-SYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeegjedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:GPyWZHMyXf5Kvsllp2a13R-ZdsUa5Eyn9zm8e_TevTvdOPqjcW5nlQ>
    <xmx:GPyWZB456YmIlexKtameEvfzxT6jb_S5LP8U4ZZ8x8ftCJgDf8Imbw>
    <xmx:GPyWZB4KiilRGFPdEeCPRk6Xvib-UQo3Rc6SHJIcWlgnWs25oEFPvQ>
    <xmx:GfyWZDvcJNvUjndis2HwHYCG9wl31VYvNLjRzs3Fi5XOZJ7a0ROd8w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B8029B60086; Sat, 24 Jun 2023 10:22:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <d9ffc44c-c4ae-4f01-bc0b-ee5359a24a0a@app.fastmail.com>
In-Reply-To: <d4156e51-102f-36b4-e42c-938268b4b608@roeck-us.net>
References: <20230417125651.25126-18-tzimmermann@suse.de>
 <c525adc9-6623-4660-8718-e0c9311563b8@roeck-us.net>
 <55130a50-d129-4336-99ce-3be4229b1c7d@app.fastmail.com>
 <d4156e51-102f-36b4-e42c-938268b4b608@roeck-us.net>
Date: Sat, 24 Jun 2023 16:21:47 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>,
 "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "Daniel Vetter" <daniel.vetter@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [v3,17/19] arch/sparc: Implement fb_is_primary_device() in source file
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230624_072222_443713_870F9A63 
X-CRM114-Status: GOOD (  13.99  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>,
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sat, Jun 24, 2023, at 15:26, Guenter Roeck wrote:
> On 6/24/23 02:27, Arnd Bergmann wrote:
>> On Sat, Jun 24, 2023, at 03:55, Guenter Roeck wrote:
>>>
>>> On Mon, Apr 17, 2023 at 02:56:49PM +0200, Thomas Zimmermann wrote:
>>>> Other architectures implment fb_is_primary_device() in a source
>>>> file. Do the same on sparc. No functional changes, but allows to
>>>> remove several include statement from <asm/fb.h>.
>>>>
>>>> v2:
>>>> 	* don't include <asm/prom.h> in header file
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>>> Cc: "David S. Miller" <davem@davemloft.net>
>>>
>>> This patch results (or appears to result) in the following build error
>>> when trying to build sparc64:allmodconfig.
>>>
>>> Error log:
>>> <stdin>:1519:2: warning: #warning syscall clone3 not implemented [-Wcpp]
>>> WARNING: modpost: drivers/cpufreq/sparc-us2e-cpufreq: section mismatch
>>> in reference: cpufreq_us2e_driver+0x20 (section: .data) ->
>>> us2e_freq_cpu_init (section: .init.text)
>>> WARNING: modpost: drivers/cpufreq/sparc-us3-cpufreq: section mismatch
>>> in reference: cpufreq_us3_driver+0x20 (section: .data) ->
>>> us3_freq_cpu_init (section: .init.text)
>>> ERROR: modpost: "__xchg_called_with_bad_pointer" [lib/atomic64_test.ko]
>>> undefined!
>> 
>> These all look like old bugs that would be trivially fixed if
>> anyone cared about sparc.
>> 
>
> Odd argument, given that this _is_ a sparc patch. Those may be old
> bugs, but at least in 6.4-rc7 sparc64:allmodconfig does at least compile.

The first three are non-fatal warnings even with CONFIG_WERROR=y, I'm
sure they have been there for years. I don't immediately see what
caused the __xchg_called_with_bad_pointer error, but it does not
look related to the fbdev patch. I would guess that this is a second
regression that happened to come in at the same time.

> Sure, I can stop build testing it if that is where things are going.

I think we clearly want to fix the fbdev regression you found, and
maybe bisect the atomic64_test as well to see if that was caused by
a recent patch to get it into a working state again.

Regarding whether to continue build testing: if every kernel build
warns about a missing syscall for almost four years (clone3 was
added in 5.3 and requires a minimal review to hook it up to asm
code), it shows that the architecture is seriously neglected
already.

     Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
