Return-Path: <SRS0=yFMY=5L=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDF51C43331
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 01:53:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D33F20714
	for <linux-snps-arc@archiver.kernel.org>; Thu, 26 Mar 2020 01:53:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JRsw7ULR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D33F20714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codesourcery.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Gk+PuXfYuwcT2u3fZmJXIMzFIuStS2BRwk3MCgIFF8=; b=JRsw7ULR0D1CUN
	7uVc6XujFtKi1amtc9UaQBovoZBg+eIXPy50eCtMBBm3R186Mo2GbA/GpWlEDYKHBqui/zAjk5zQh
	yoJT2k4lHmFCNaMUu6Zh4UgtXWc9twul37NKxYRcRAqRku3Qnuy8mvhGp2ehnqW40J5xKypd45GZG
	ds5yweH4rDTnb6wqRjGRihEi0CcA0WnYB9rWwKbSjy2/7+IQ28Rv3tMqSZLpNqzJkCF+hEr01Xn64
	4ou3z72OUQXbZxvQ+QDZ9e54gL9fhQmVvnWoARpri/Wd/Xphi6dQznduStw3IsCXjth/0tGhl2Z/7
	rXR9C8zRG/rimyHPKJoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jHHhc-0005iU-SQ; Thu, 26 Mar 2020 01:53:00 +0000
Received: from esa3.mentor.iphmx.com ([68.232.137.180])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jHHhZ-0005hy-1m
 for linux-snps-arc@lists.infradead.org; Thu, 26 Mar 2020 01:53:00 +0000
IronPort-SDR: +1a8SItYYoBljiiY09Lz4fN7SOf/pTofF6KqClnRzsNJmY3DUEGGJpYvsjeQ3rZZD404TebJo5
 Ie9UfzkskdW/6KRuKrPWi6Bu+a7yedRHqDH0aUo9AI+LHceIH1YDQT2fUEyzPvV/02gnTehISz
 za3Y5QlAg6W0WasiVX8wxbPzfq54LCwKPBfExvurY9iNhkSK29ommMLaZBqhtHwOcFIhNAyNI+
 /j2wqOR9AV7grhukn8QWSz1Z7LFtGOXmOq3NzZ/YKr/BoMC8ZalMRw5n8gDECtM9ohzKtzJvPY
 Eds=
X-IronPort-AV: E=Sophos;i="5.72,306,1580803200"; d="scan'208";a="47122373"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
 by esa3.mentor.iphmx.com with ESMTP; 25 Mar 2020 17:52:54 -0800
IronPort-SDR: ZEWfNsadZIcX24jeXNc030eed0qvZ05QMx3U/h1KVq/COMv/pBnXmwNU3VijakdwddRnckP/13
 4n1hsRD+omy1CA6ysJdh10czZyHZEwqHbqOtZnho6q3fNON8JXpelj73Q1BzjEUHGCtxmQ4Iiy
 KLlz/G1yOGEZLl+wCktCE2P9sx8SX48d9wKyi4dVXUEft/xQ12GBn4+oqP/t3jjEQR05kID0Hb
 H6azVXhN47N+IUnUKFUdCbKYX9inW2fzwnsTLGmKKlHA9ZWD1pQ1ljDLBMXTEbtT72XtdX/oh7
 zS8=
Date: Thu, 26 Mar 2020 01:52:49 +0000
From: Joseph Myers <joseph@codesourcery.com>
X-X-Sender: jsm28@digraph.polyomino.org.uk
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Subject: Re: [PATCH v4 02/15] ARC: ABI Implementation
In-Reply-To: <20200313030419.15843-3-vgupta@synopsys.com>
Message-ID: <alpine.DEB.2.21.2003260138130.31593@digraph.polyomino.org.uk>
References: <20200313030419.15843-1-vgupta@synopsys.com>
 <20200313030419.15843-3-vgupta@synopsys.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_185257_126021_D7898334 
X-CRM114-Status: GOOD (  15.07  )
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
Cc: linux-snps-arc@lists.infradead.org, libc-alpha@sourceware.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Thu, 12 Mar 2020, Vineet Gupta via Libc-alpha wrote:

> diff --git a/sysdeps/arc/bits/endianness.h b/sysdeps/arc/bits/endianness.h
> new file mode 100644
> index 000000000000..8f17ca84b485
> --- /dev/null
> +++ b/sysdeps/arc/bits/endianness.h
> @@ -0,0 +1,15 @@
> +#ifndef _BITS_ENDIANNESS_H
> +#define _BITS_ENDIANNESS_H 1
> +
> +#ifndef _BITS_ENDIAN_H
> +# error "Never use <bits/endian.h> directly; include <endian.h> instead."
> +#endif
> +
> +/* ARC has selectable endianness.  */
> +#ifdef __BIG_ENDIAN__
> +# define __BYTE_ORDER __BIG_ENDIAN
> +#else
> +# define __BYTE_ORDER __LITTLE_ENDIAN
> +#endif

Elsewhere you say the port is little-endian only.  In such cases we 
generally have an error somewhere if you attempt to build glibc for the 
other endianness, to avoid an other-endian configuration accidentally 
building but not working and having a broken ABI.  For example, see what 
Nios II does: sysdeps/nios2/bits/endianness.h handles both endiannesses, 
but sysdeps/nios2/configure.ac produces an error for big-endian.

> +/* PLT jump into resolver passes PC of PLTn, while _dl_fixup expects the
> +   address of corresponding .rela.plt entry.  */
> +
> +#ifdef __A7__
> +# define ARC_PLT_SIZE	12
> +#else
> +# define ARC_PLT_SIZE	16
> +#endif

Is this some sort of ABI difference between two incompatible ABIs?  (The 
ABI document you pointed to only seems to mention 12-byte PLT entries.)

> +#define reloc_index						\
> +({								\
> +  unsigned long int plt0 = D_PTR (l, l_info[DT_PLTGOT]);	\
> +  unsigned long int pltn = reloc_arg;				\
> +  /* Exclude PL0 and PLT1.  */					\

Should PL0 be PLT0 here?

> +  unsigned long int idx = (pltn - plt0)/ARC_PLT_SIZE - 2;	\

Missing spaces around '/'.

> diff --git a/sysdeps/arc/gmp-mparam.h b/sysdeps/arc/gmp-mparam.h
> new file mode 100644
> index 000000000000..5580551483c8
> --- /dev/null
> +++ b/sysdeps/arc/gmp-mparam.h
> @@ -0,0 +1,23 @@
> +/* gmp-mparam.h -- Compiler/machine parameter header file.
> +
> +Copyright (C) 2017-2020 Free Software Foundation, Inc.
> +
> +This file is part of the GNU MP Library.
> +
> +The GNU MP Library is free software; you can redistribute it and/or modify
> +it under the terms of the GNU Lesser General Public License as published by
> +the Free Software Foundation; either version 2.1 of the License, or (at your
> +option) any later version.
> +
> +The GNU MP Library is distributed in the hope that it will be useful, but
> +WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
> +or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser General Public
> +License for more details.
> +
> +You should have received a copy of the GNU Lesser General Public License
> +along with the GNU MP Library; see the file COPYING.LIB.  If not, see
> +<https://www.gnu.org/licenses/>.  */
> +
> +#include <sysdeps/generic/gmp-mparam.h>
> +
> +#define IEEE_DOUBLE_BIG_ENDIAN 0

Plenty of architectures that have, or support, little-endian floating 
point do not have gmp-mparam.h at all.  IEEE_DOUBLE_BIG_ENDIAN is only 
used to define union ieee_double_extract, which is nowhere used in glibc.  
So I don't think you need this header at all (and it shows up the scope 
for a more general cleanup possible for other ports, I suspect only the 
x32 and mips64 versions of this header, the ones that define 
_LONG_LONG_LIMB for ILP32 configurations with 64-bit registers, are the 
only non-generic ones that do anything useful - but you don't need to do 
that cleanup).

-- 
Joseph S. Myers
joseph@codesourcery.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
