Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C89B5E7718B
	for <linux-snps-arc@archiver.kernel.org>; Mon, 23 Dec 2024 14:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdKj6nLg/0jOYJL6Z+IXPeuO4wj6R+XpECyBn72QOXo=; b=ac6Cmerv+Z3bWM
	anku4xrs3mlNbcBVr9FZAFQb8ahKvGqs2BJy55+RpYzxMwz0IMfDED3up1fo0Gue2cQnEpjbxC+bg
	TZb1FYJbLbw41Kj0+fHAVdLd7dTi5V/D02LM80wm4FGr3a3GEktgB9qy+MgBQU3l5vLpDTdboqXu5
	BHM2rx8DeMF7xjbok+FZLkz2jTn8rU8b9kTj0GdsTIf8Ji8On8Z1FpkjN+5sNkj6WpIysdVuWO/kc
	ENcRcTaqoasfmwqUSn12BewhUKlpCVcE82QzHOPdZNyauGRDYeb4VX3288vrXIcbpu0E+qrbO8Agf
	ueUB4VLbipVmwkar7djw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPjB6-0000000A8Ee-1Q9u;
	Mon, 23 Dec 2024 14:13:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPj9u-0000000A8BE-3raH;
	Mon, 23 Dec 2024 14:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dCyRWQ972dtOINVtyAVn81C8nfT1RGQs2k54AD/bYLs=; b=LvnBlZkxaAQcGWjKm74geiPb8b
	09HC8Lx+buTgAeFqfUallLiC3HRRhjZAWenw+4LMprOjWHtImbuP0gOLAvr6hVS5i0ZdLYKyoJ2WK
	OQzcsKdZfQRn6x1GcTLPrM6HTTwRmEcYfFss8m/Wg7gS1PKi5RI3zL/mx37kIQVuF+AM7MlNgGQzE
	bB6cjUfxrAu2Nx5xhbJuFZde5iiNd/MnBmZgIfqZpdZ4a/gDrYmHlAyNkEnLB4tG3A+nIbtxS3799
	X61H5r2cbbJLiyr0MZAAu24at81I2tX15MU0Whn9Fo5EnZb48D6o3vyqEKBtRf3nG3db+nJdAw53q
	K3L1LeWA==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPj9r-00000006NF2-2cLL;
	Mon, 23 Dec 2024 14:11:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7CEEB5C5784;
	Mon, 23 Dec 2024 14:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA92BC4CED3;
	Mon, 23 Dec 2024 14:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734963097;
	bh=TFDZ10LCzVzAVPmwwXm1t1ueVZF764P4MBpvUBlhNIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DSQ/9oqUd/i8BtwF4iftPWzrU1PL2X85JlLOlxJo76cCjvgHDscBZVpdNQeibO6j4
	 c3jg1iRIB+kOFMRX1B1URWZhmVYfUKJf4gYpvS3oEMfz2ae/5WsqAZR42xkNtyoMSa
	 pUxuTMJKZlgiFj/MFMTIOeb9hMrMQGZoX4FYkddlTIZNIS+/ntAEcUTaVkVqL/9Go4
	 GAfEZcAFaFLo8IhQ57ss2owCDS9KfDFUXdCVTLe577CUrwn6ejNG84Mis0iW1mtJeB
	 47oDxRIhG9Dtr3pG/SEttZdOYgSn5yP2M7IqzDzb6krMTRelLa/lqVFyjkoNNvklbw
	 lY+9bB0XI66WA==
Date: Mon, 23 Dec 2024 06:11:35 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: wzs <wangzhengshu39@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-parisc@vger.kernel.org, x86@kernel.org
Subject: Re: WARNING: kernel stack regs has bad "bp" value
Message-ID: <20241223141135.g5lkpzhz32pcpzku@jpoimboe>
References: <CAGXGE_LB3RBqujRWE4fai5hrG6WHk-_c9mToEc0Q_1rBY7M9Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGXGE_LB3RBqujRWE4fai5hrG6WHk-_c9mToEc0Q_1rBY7M9Xg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_141143_889656_9EA1BFA0 
X-CRM114-Status: GOOD (  11.32  )
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

On Mon, Dec 23, 2024 at 11:34:58AM +0800, wzs wrote:
> Hello,
> when fuzzing the Linux Kernel,
> i encountered several rare kernel warnings.
> It seems that the warning is related to the kernel stack.
> The versions in which this appeared are from Linux-6.8.0 to 6.13-rc3.
> 
> The two warning messages I provide below are both from the latest
> kernel version, Linux-6.13-rc3.
> If you need warnings from other versions, I would be happy to provide
> them as well.
> 
> kernel config :https://pastebin.com/hGFvz9vz
> console output1 :https://pastebin.com/7vBkDAvK
> console output2 : https://pastebin.com/T8h3Hnrr

I assume you booted with unwind_debug on the cmdline?  This "warning" is
harmless, in fact it's not a real WARNING, it's only a stack dump which
is useful for debugging stack tracing issues.

Can you share the dissassembly of vmw_send_msg? e.g. something like

  objdump -r --disassemble=vmw_send_msg vmwgfx.ko

-- 
Josh

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
