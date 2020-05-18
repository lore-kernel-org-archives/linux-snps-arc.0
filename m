Return-Path: <SRS0=uiT2=7A=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CF0C433E0
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 04:29:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71BED20787
	for <linux-snps-arc@archiver.kernel.org>; Mon, 18 May 2020 04:29:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AvdK+LRt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LimDPPmi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71BED20787
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzkkR+34spf5zlG3kUM2JW712+pe1bgGPOEhXwtw0Cg=; b=AvdK+LRtwRd+5i
	NmlK+PXZSut1b/02EC8ZJzKxOf0qadKSwaLFeCkrrCU4z65/JH69o8gQiqF++8xLhxj00ORYQ4Cjj
	6yGAtTH2iBgSmKD7Z9qKWo2j69yVfogD/nZt1FU3nZ7DwvsiQzJbN21vkyoXCKNcYO4EeWPqakDjl
	0REsjXCODmpd/G0wr4eQ7xvHk0//41j80J7mw1fwKTMq3uIkSDXQxbeNIRTXoUQvwPjQvr808rM3J
	28aIb5kuovTCl4x7rEi/+/eK9CQsYQVlBGSwJPJf/kpRAUOyGLGZfNWvdNuWrnEn4pRVYg/16WhES
	887TRLKxrfyL8GnOnIyA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jaXPG-00075B-5z; Mon, 18 May 2020 04:29:38 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jaXPD-00074C-7R; Mon, 18 May 2020 04:29:36 +0000
Received: by mail-pg1-x542.google.com with SMTP id b8so4223802pgi.11;
 Sun, 17 May 2020 21:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7bbx1vjAcGJU7o+yFip4EyC/ilyC7OBp4VPSqw3/c2c=;
 b=LimDPPmibz9vtWmb0MKZHn8c9RdWix1P/AFk6SDLaoXlBVdMlC7Hfce2We+MkFAz4E
 R/2Wy61j9gG0ixy9mMyHuhS77QZ+W2IqUs+cNkzrG6dQaDcMMpIgqWZr6ft8gTO/HSMB
 oF3oavsgnI2fjkM2QAjIyKAHhhOTcnWFH16xKUZkqjczHwsm/iprxuSgfWtVik27j84r
 5n8U7fFfETauYry76p+6vX2RXQib8sKv+lhcWS2IP1EZ6KlTna+BQg/FRhPkbiW1PxTM
 QM0E7X94qZuWMPHXEPUx2ysbg6/oZL89r6bgB9KXLUanLbbSlSBCGfqIrn7x7qAQncoA
 /GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7bbx1vjAcGJU7o+yFip4EyC/ilyC7OBp4VPSqw3/c2c=;
 b=M4My+a+kuv/J8grEz4VDRybdC5WjM+3TUK3vMZUFHMwt/GIqy2YaKGBCAcAOG0vkth
 3fiwFqEMlbwVKnYWUdsikgxb6oLipAXs+aHXICvwI6Usm9TwUvdPjAG0UVAlIpwZGOve
 7BjxCvNzxufgikc5CHUDvvxP6vBQfJnZtj6FReNoRkIjuZkUQtm5HzlU86ZqRpS8v93M
 hPS8t8ngRyC4iLKWditKDUiLFscx3nbRXDxD5LFweY3Z4uAaciL37Zf5fFhs/cC7HX0E
 R1K8wQHE11sIdpmRQVLNqT/KkG8Ck2GGtah6suVmoMVdS0+Fr3OJnfwO6EbZ80I53plh
 M8HA==
X-Gm-Message-State: AOAM531kX+8BTracYrLG8ayupCwIWinbyaXxZw5sAwlRbLDAezJVTaZ1
 8AmXpSPg9iL7P0iQy/c/2hM=
X-Google-Smtp-Source: ABdhPJxbJqkFB3G+mfP7Q58PJuzXycNotbRv9vDLFxrEQ/xV/2+VRINR3zhBhOzJGROFI8CL8Y8+Lg==
X-Received: by 2002:aa7:9a96:: with SMTP id w22mr15841791pfi.199.1589776174113; 
 Sun, 17 May 2020 21:29:34 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 62sm7548040pfc.204.2020.05.17.21.29.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 17 May 2020 21:29:33 -0700 (PDT)
Date: Sun, 17 May 2020 21:29:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH V3 07/15] arch/kunmap_atomic: Consolidate duplicate code
Message-ID: <20200518042932.GA59205@roeck-us.net>
References: <20200507150004.1423069-1-ira.weiny@intel.com>
 <20200507150004.1423069-8-ira.weiny@intel.com>
 <20200516223306.GA161252@roeck-us.net>
 <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200518034938.GA3023182@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200517_212935_286775_A17FCA0A 
X-CRM114-Status: GOOD (  16.99  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Helge Deller <deller@gmx.de>,
 x86@kernel.org, linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Sun, May 17, 2020 at 08:49:39PM -0700, Ira Weiny wrote:
> On Sat, May 16, 2020 at 03:33:06PM -0700, Guenter Roeck wrote:
> > On Thu, May 07, 2020 at 07:59:55AM -0700, ira.weiny@intel.com wrote:
> > > From: Ira Weiny <ira.weiny@intel.com>
> > > 
> > > Every single architecture (including !CONFIG_HIGHMEM) calls...
> > > 
> > > 	pagefault_enable();
> > > 	preempt_enable();
> > > 
> > > ... before returning from __kunmap_atomic().  Lift this code into the
> > > kunmap_atomic() macro.
> > > 
> > > While we are at it rename __kunmap_atomic() to kunmap_atomic_high() to
> > > be consistent.
> > > 
> > > Reviewed-by: Christoph Hellwig <hch@lst.de>
> > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > 
> > This patch results in:
> > 
> > Starting init: /bin/sh exists but couldn't execute it (error -14)
> > 
> > when trying to boot microblazeel:petalogix-ml605 in qemu.
> 
> Thanks for the report.  I'm not readily seeing the issue.
> 
> Do you have a kernel config?  Specifically is CONFIG_HIGHMEM set?
> 
See below. Yes, CONFIG_HIGHMEM is set.

The scripts used to build and boot the image are at:

https://github.com/groeck/linux-build-test/tree/master/rootfs/microblazeel

Hope this helps,

Guenter

---
CONFIG_SYSVIPC=y
CONFIG_POSIX_MQUEUE=y
CONFIG_AUDIT=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_SYSFS_DEPRECATED=y
CONFIG_SYSFS_DEPRECATED_V2=y
CONFIG_BLK_DEV_INITRD=y
# CONFIG_BASE_FULL is not set
CONFIG_KALLSYMS_ALL=y
CONFIG_EMBEDDED=y
CONFIG_SLAB=y
CONFIG_KERNEL_BASE_ADDR=0x50000000
CONFIG_XILINX_MICROBLAZE0_USE_MSR_INSTR=1
CONFIG_XILINX_MICROBLAZE0_USE_PCMP_INSTR=1
CONFIG_XILINX_MICROBLAZE0_USE_BARREL=1
CONFIG_XILINX_MICROBLAZE0_USE_DIV=1
CONFIG_XILINX_MICROBLAZE0_USE_HW_MUL=2
CONFIG_XILINX_MICROBLAZE0_USE_FPU=2
CONFIG_XILINX_MICROBLAZE0_HW_VER="10.0.a"
CONFIG_HZ_100=y
CONFIG_MMU=y
CONFIG_HIGHMEM=y
CONFIG_PCI_XILINX=y
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
# CONFIG_BLK_DEV_BSG is not set
CONFIG_PARTITION_ADVANCED=y
# CONFIG_EFI_PARTITION is not set
CONFIG_NET=y
CONFIG_PACKET=y
CONFIG_UNIX=y
CONFIG_INET=y
# CONFIG_IPV6 is not set
CONFIG_BRIDGE=m
CONFIG_PCI=y
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
CONFIG_MTD=y
CONFIG_MTD_CFI=y
CONFIG_MTD_CFI_INTELEXT=y
CONFIG_MTD_CFI_AMDSTD=y
CONFIG_BLK_DEV_RAM=y
CONFIG_BLK_DEV_RAM_SIZE=8192
CONFIG_NETDEVICES=y
CONFIG_XILINX_EMACLITE=y
CONFIG_XILINX_LL_TEMAC=y
# CONFIG_INPUT is not set
# CONFIG_SERIO is not set
# CONFIG_VT is not set
CONFIG_SERIAL_8250=y
CONFIG_SERIAL_8250_CONSOLE=y
CONFIG_SERIAL_OF_PLATFORM=y
CONFIG_SERIAL_UARTLITE=y
CONFIG_SERIAL_UARTLITE_CONSOLE=y
# CONFIG_HW_RANDOM is not set
CONFIG_XILINX_HWICAP=y
CONFIG_I2C=y
CONFIG_I2C_XILINX=y
CONFIG_SPI=y
CONFIG_SPI_XILINX=y
CONFIG_GPIOLIB=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_XILINX=y
# CONFIG_HWMON is not set
CONFIG_WATCHDOG=y
CONFIG_XILINX_WATCHDOG=y
CONFIG_FB=y
CONFIG_FB_XILINX=y
# CONFIG_USB_SUPPORT is not set
CONFIG_UIO=y
CONFIG_UIO_PDRV_GENIRQ=y
CONFIG_UIO_DMEM_GENIRQ=y
CONFIG_EXT2_FS=y
# CONFIG_DNOTIFY is not set
CONFIG_CRAMFS=y
CONFIG_ROMFS_FS=y
CONFIG_NFS_FS=y
CONFIG_CIFS=y
CONFIG_CIFS_STATS2=y
CONFIG_ENCRYPTED_KEYS=y
CONFIG_DEBUG_INFO=y
CONFIG_KGDB=y
CONFIG_KGDB_TESTS=y
CONFIG_KGDB_KDB=y
CONFIG_DEBUG_SLAB=y
CONFIG_DETECT_HUNG_TASK=y
CONFIG_DEBUG_SPINLOCK=y

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
