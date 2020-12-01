Return-Path: <SRS0=KE/D=FF=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D4CBC64E7B
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 11:35:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66527206A5
	for <linux-snps-arc@archiver.kernel.org>; Tue,  1 Dec 2020 11:35:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cM2JefQI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66527206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=physik.fu-berlin.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=riiRYmGLLlURVS/+vT7USZNDvhMbP9Nkv7X/TX8w6zA=; b=cM2JefQIlVZ9dEjRIDd0jZjl/
	7heg54xHX2H12PqLExJBf2Zqd1nIcgR+4SMZeKs0rkbpqg1yFKDL388+43NnU/KRh6UNWjJoXkYJl
	5EoKgPu4BQZo3rHSfP2/H72ReiH9N4n4+yCSz6TJbietHW2gHD9y8T/wHhagcGKH9gytD32GOG9pr
	SLzZbhMY7NdqCqk0v0dXKRF20pJd0VZvMXwxPgH8/FXOionfmlxr8GGkOGhaBY3A3m4m6UbaCAlSK
	PeKXEglHXmdRMe+Pwh2oQFF0dXSSheZI4kXgyRgprvVosK6D27MfzNcv0WImEapfTJgYsKg8B+mZn
	bCm4gvv5g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk3wF-0000xw-Ak; Tue, 01 Dec 2020 11:35:19 +0000
Received: from outpost1.zedat.fu-berlin.de ([130.133.4.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk3wC-0000wT-Uz; Tue, 01 Dec 2020 11:35:18 +0000
Received: from inpost2.zedat.fu-berlin.de ([130.133.4.69])
 by outpost.zedat.fu-berlin.de (Exim 4.94) with esmtps (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (envelope-from <glaubitz@zedat.fu-berlin.de>)
 id 1kk3w7-000R6c-Iq; Tue, 01 Dec 2020 12:35:11 +0100
Received: from suse-laptop.physik.fu-berlin.de ([160.45.32.140])
 by inpost2.zedat.fu-berlin.de (Exim 4.94) with esmtpsa (TLS1.2)
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
 (envelope-from <glaubitz@physik.fu-berlin.de>)
 id 1kk3w7-000YLZ-3I; Tue, 01 Dec 2020 12:35:11 +0100
Subject: Re: [PATCH v2 00/13] arch, mm: deprecate DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>
References: <20201101170454.9567-1-rppt@kernel.org>
 <43c53597-6267-bdc2-a975-0aab5daa0d37@physik.fu-berlin.de>
 <20201117062316.GB370813@kernel.org>
 <a7d01146-77f9-d363-af99-af3aee3789b4@physik.fu-berlin.de>
 <20201201102901.GF557259@kernel.org>
From: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Message-ID: <e3d5d791-8e4f-afcc-944c-24f66f329bd7@physik.fu-berlin.de>
Date: Tue, 1 Dec 2020 12:35:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201102901.GF557259@kernel.org>
Content-Language: en-US
X-Original-Sender: glaubitz@physik.fu-berlin.de
X-Originating-IP: 160.45.32.140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_063517_144275_95CA6E8A 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org,
 Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>,
 Jonathan Corbet <corbet@lwn.net>, Meelis Roos <mroos@linux.ee>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, Alexey Dobriyan <adobriyan@gmail.com>,
 linux-m68k@lists.linux-m68k.org, linux-arm-kernel@lists.infradead.org,
 Michael Schmitz <schmitzmic@gmail.com>, Tony Luck <tony.luck@intel.com>,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

Hi Mike!

On 12/1/20 11:29 AM, Mike Rapoport wrote: 
> These changes are in linux-mm tree (https://www.ozlabs.org/~akpm/mmotm/
> with a mirror at https://github.com/hnaz/linux-mm)
> 
> I beleive they will be coming in 5.11.

Just pulled from that tree and gave it a try, it actually fails to build:

  LDS     arch/ia64/kernel/vmlinux.lds
  AS      arch/ia64/kernel/entry.o
arch/ia64/kernel/entry.S: Assembler messages:
arch/ia64/kernel/entry.S:710: Error: Operand 2 of `and' should be a general register
arch/ia64/kernel/entry.S:710: Error: qualifying predicate not followed by instruction
arch/ia64/kernel/entry.S:848: Error: Operand 2 of `and' should be a general register
arch/ia64/kernel/entry.S:848: Error: qualifying predicate not followed by instruction
  GEN     usr/initramfs_data.cpio
make[1]: *** [scripts/Makefile.build:364: arch/ia64/kernel/entry.o] Error 1
make: *** [Makefile:1797: arch/ia64/kernel] Error 2
make: *** Waiting for unfinished jobs....
  CC      init/do_mounts_initrd.o
  SHIPPED usr/initramfs_inc_data
  AS      usr/initramfs_data.o

Adrian

-- 
 .''`.  John Paul Adrian Glaubitz
: :' :  Debian Developer - glaubitz@debian.org
`. `'   Freie Universitaet Berlin - glaubitz@physik.fu-berlin.de
  `-    GPG: 62FF 8A75 84E0 2956 9546  0006 7426 3B37 F5B5 F913


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
