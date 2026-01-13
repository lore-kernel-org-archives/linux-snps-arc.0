Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C48D29DD1
	for <linux-snps-arc@archiver.kernel.org>; Tue, 13 Jan 2026 06:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q4cB9o8ckgspm/usM/acDWVJZOR3Ozjh27Zq5HHCgrs=; b=0fI1vuaIIIOZ4h
	ipZOdkcLQZ0DUmaIBNOYxJDpmZWNdsgKIugt4svVBdkeUEfJXqtowOYpQf220pveQgwImNToGw47A
	D8bU9Nx1hLNG7KmiXht/E0RE0AqTTDCiztM5JS4DzBAT43cwDddFQeVhfMiX8toqLGPHGBVqbTz4v
	SBR8B8ksYNj2NGny3QO0ytCpdxVFmEnQaktlejblr8xN5Oa7uzBTCj1TVvXmGviHQIlu13U2JoUdk
	bRkYzQMMCsT270eHi94CB2ICM5bmD4iyJ9SrIdGFHjaMDZ+3SsrHAPNMMibGq0L6IGeLoUT4zINTU
	miKHU6Imww4Mp1bE6Jzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXee-00000006a8q-1B0f;
	Tue, 13 Jan 2026 06:13:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXec-00000006a8Z-493S
	for linux-snps-arc@lists.infradead.org;
	Tue, 13 Jan 2026 06:13:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 108B760017;
	Tue, 13 Jan 2026 06:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CDD8C116C6;
	Tue, 13 Jan 2026 06:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768284801;
	bh=tcLwKl29y1Aw1jNZ9CT/XY/qOBcKIiMKPKSxUolbQ34=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lNILGEeE22XMTkyy+9XaM/YuwhrhL+Bpt5lI6j3CxM2/jhN0AGdyIKSnCiXWaE2CK
	 47jVtBvmFMe9e55/qB1qq/TVVFkw7vlH2PepkrhFsXakgXM9RMSU/pVKMkO+agoppZ
	 iZBWz3vCvFbQ3NJrRf9kID7DfVUorz/I5CSJT1NKZC8dIdXCyblnng3KaWijjp6Em4
	 wX2/ZYITTaqdkgoLOLzGhXsCgPe9BPbmqwRNqtetx1uJ7D2rm6LEKwvdYyzu7O4T6D
	 t4E94mDkDX7Wj+nfoVneOePR4noDUoGcAGLM6sZA9j0hONCtwhCiq0/DJhVgbgCZRl
	 uMpXFJrcs5zdQ==
Message-ID: <b92a06fb-9032-4b96-a733-e80fe6ddfb20@kernel.org>
Date: Mon, 12 Jan 2026 22:13:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [thomas-weissschuh:b4/at-vector-size-arch 2/24] ERROR: modpost:
 "__bswapsi2" [fs/ecryptfs/ecryptfs.ko] undefined!
To: kernel test robot <lkp@intel.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org
References: <202601131142.f4Kyqt82-lkp@intel.com>
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
In-Reply-To: <202601131142.f4Kyqt82-lkp@intel.com>
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



On 1/12/26 19:20, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/at-vector-size-arch
> head:   48790f0896dc14ed71a371b1a81ecd5c32347185
> commit: 7ad4197ef8bdb56c2e4b411acc9bb311e91f6350 [2/24] ARC: Always use SWAPE instructions and enable ARCH_USE_BUILTIN_BSWAP
> config: arc-randconfig-001-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131142.f4Kyqt82-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 8.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131142.f4Kyqt82-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601131142.f4Kyqt82-lkp@intel.com/
>
> All errors (new ones prefixed by >>, old ones prefixed by <<):
>
>>> ERROR: modpost: "__bswapsi2" [fs/ecryptfs/ecryptfs.ko] undefined!
>>> ERROR: modpost: "__bswapdi2" [fs/ecryptfs/ecryptfs.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [security/keys/trusted-keys/trusted.ko] undefined!
>>> ERROR: modpost: "__bswapdi2" [crypto/wp512.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/pinctrl/pinctrl-single.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/video/backlight/qcom-wled.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbfillrect.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbcopyarea.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/cfbimgblt.ko] undefined!
>>> ERROR: modpost: "__bswapsi2" [drivers/video/fbdev/core/sysfillrect.ko] undefined!
> WARNING: modpost: suppressed 92 unresolved symbol warnings because there were too many)
>
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for CAN_DEV
>    Depends on [n]: NETDEVICES [=n] && CAN [=y]
>    Selected by [y]:
>    - CAN [=y] && NET [=y]

Sorry my bad.
While ARC770 cpus do support swape, it seems gcc doesn't define the builtin for
arc700 (and generates a libcall) and as Arnd mentioned we don't have -mcpu=arc770.
As a quick fix/hack we could add EXPORT_SYMBOL this in arch/arc/kernel/arcksyms.c ?

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
