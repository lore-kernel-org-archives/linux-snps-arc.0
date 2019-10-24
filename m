Return-Path: <SRS0=lfWa=YR=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 456E8CA9EBC
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Oct 2019 15:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BE402166E
	for <linux-snps-arc@archiver.kernel.org>; Thu, 24 Oct 2019 15:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XzsmbF72";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="biNiyBsU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1BE402166E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6PkmJVnqv8hTaJSV95cy7lOze22406x8IIsktIM+cf8=; b=XzsmbF72mrHKHMlVGn/ml3FTD
	9hUWCuW8DtFlLC1/VjFp5l/s+ORJnFzQNG4igiDmjhIoQtS3DxU2wHpLBDDnTkEZz9yAlC3n4/y2Q
	8WENI1usD3sif6sCU6n38SK4hnWgNS4oejZZI4SxWy/pH1n8W1H0BAzGdayrO+YK1lbNJk/Jewqhh
	wZU6IVD8czsrUC76qSUlUUqWtyiAmJ4gHI1MczU53CALp2IOBARWyvgwMZdZ2NxcQjxRDZTPGD5iR
	RitUAYMFfarU+RT85TDzQZ/kyAPa0BDPivgTmoqXJq/JH7NMDZ/WaRfY9UnJ9EhXVKxq6D9nzv8sn
	PaOb6gstw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNesP-00044s-Pp; Thu, 24 Oct 2019 15:18:13 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNesL-00042H-V9
 for linux-snps-arc@lists.infradead.org; Thu, 24 Oct 2019 15:18:11 +0000
Received: by mail-il1-x143.google.com with SMTP id p8so13028424ilp.2
 for <linux-snps-arc@lists.infradead.org>; Thu, 24 Oct 2019 08:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=Ounxj9cfL6O+QVspuA41qPrL+dtHlnd6zlmABTsVbws=;
 b=biNiyBsUq1oC7u5yogZy8N29MX7ATTQIXUIPIqqI6g2N8EA9QhwEC0gQemO8Cy5L6a
 UCFg3RDAYG9lnvohF8+tXuDf+IXq7fLq3dVHXnLyE5vPEUz/DrCR7X3R288BYePyqXg3
 oYLT/wTPksWncWN9bXdK0yZ0nbFI3oEoJl84Ht2i67n/365THu308Y+OSHFJ18vXXUqR
 ENefMt09zBo4nBburoq/NmiNK2bRI59OT7KW1kTA/yDrLysLajr6fUNNc1LVC2TMXMzE
 JIj7P2KKqLbrHsjaQFkGpARY6E99HHxeUwRHMbgsRgF/uSl1vSWl2lvW9K349Ga0HXcy
 1zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=Ounxj9cfL6O+QVspuA41qPrL+dtHlnd6zlmABTsVbws=;
 b=HTOL9awylvcU9UFfqzfQIwNW9xRw4IwdiBBMWohVijUKthyhXyKMkklLkU4USLrdP+
 pRCOEzWFVsEe5n4HCNTt2NuoU/5VJxvApy2aVP5Wmhn8BlnsgKV9eOIP6Zbp8DtPsQZ2
 XaIc9tVBg0XJjebOt0jfCTmSu5IGnQ6mcqrt+8R4WUkAXhzjLqGJLdSwWcTIduXByRhm
 VkEj95zDTXFm3P2WYcQkRET7FcZz4C+gYpftTdPSB2mdtumarX1Eiwhe/AmeNwGTgbxh
 FiKB//Vk2XtB+GX2msOTNX73zonvvxsMcX9GjdsC8GempZ7sDrwBo7b9zt+ZxdWdkrJQ
 fpLg==
X-Gm-Message-State: APjAAAVwumXQkpunG2fhtb/FP2tVRslC6uGR5otz2NKAW0eETBb9m4eV
 /waBq/72UPvcTmAmgEWU+Mhgcw==
X-Google-Smtp-Source: APXvYqxQ1LtEDnMpoN971luqOI7TbH4CJsi6LuiXRaB4c6bbMVkSBP/cjpjqc6MBqdQnstOla4Sq8g==
X-Received: by 2002:a92:8fc6:: with SMTP id r67mr43423606ilk.5.1571930288560; 
 Thu, 24 Oct 2019 08:18:08 -0700 (PDT)
Received: from localhost ([64.62.168.194])
 by smtp.gmail.com with ESMTPSA id y5sm7755183ilm.63.2019.10.24.08.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 08:18:07 -0700 (PDT)
Date: Thu, 24 Oct 2019 08:17:59 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: Michal Simek <michal.simek@xilinx.com>
Subject: Re: [PATCH 1/2] asm-generic: Make msi.h a mandatory include/asm header
In-Reply-To: <a021f232968cfffe3f2d838da47214c6bbdeeedb.1571911976.git.michal.simek@xilinx.com>
Message-ID: <alpine.DEB.2.21.9999.1910240810420.20010@viisi.sifive.com>
References: <cover.1571911976.git.michal.simek@xilinx.com>
 <a021f232968cfffe3f2d838da47214c6bbdeeedb.1571911976.git.michal.simek@xilinx.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-165076562-1571930279=:20010"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_081810_024671_15FC0F7F 
X-CRM114-Status: GOOD (  12.14  )
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
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Eric Biggers <ebiggers@google.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, palmer@sifive.com,
 linux-mips@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-arch@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>, Jackie Liu <liuyun01@kylinos.cn>,
 Russell King <linux@armlinux.org.uk>, hch@infradead.org,
 Firoz Khan <firoz.khan@linaro.org>, Wesley Terpstra <wesley@sifive.com>,
 James Hogan <jhogan@kernel.org>, helgaas@kernel.org,
 linux-snps-arc@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, git@xilinx.com, longman@redhat.com,
 linux-arm-kernel@lists.infradead.org, monstr@monstr.eu,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, Vineet Gupta <vgupta@synopsys.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@mips.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-165076562-1571930279=:20010
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 24 Oct 2019, Michal Simek wrote:

> msi.h is generic for all architectures expect of x86 which has own versio=
n.
> Enabling MSI by including msi.h to architecture Kbuild is just additional
> step which doesn't need to be done.
> The patch was created based on request to enable MSI for Microblaze.
>=20
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
> ---
>=20
> https://lore.kernel.org/linux-riscv/20191008154604.GA7903@infradead.org/

[ ... ]

> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuil=
d
> index 16970f246860..1efaeddf1e4b 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -22,7 +22,6 @@ generic-y +=3D kvm_para.h
>  generic-y +=3D local.h
>  generic-y +=3D local64.h
>  generic-y +=3D mm-arch-hooks.h
> -generic-y +=3D msi.h
>  generic-y +=3D percpu.h
>  generic-y +=3D preempt.h
>  generic-y +=3D sections.h

Acked-by: Paul Walmsley <paul.walmsley@sifive.com> # arch/riscv
Tested-by: Paul Walmsley <paul.walmsley@sifive.com> # build only, rv32/rv64

Thanks Micha=B3,


- Paul
--8323329-165076562-1571930279=:20010
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc

--8323329-165076562-1571930279=:20010--

