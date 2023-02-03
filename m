Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF0DC61DA4
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Feb 2023 14:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AkcQFp72nIzWLx2XGAfawQ6k4WWjLMeDturFlZyv7OE=; b=XDmZr+NKziG3fi
	rDt3dZ7v8X8x4pcaPNtUYie1GCzQu+EieOfASIbUtfV+JtKstF4NliZmXw5Hx7HzRU2puK/+HDnEM
	E3HwivoRO8djSLZWJYldhI811pkMT7U+e5tr95gANKqBmiDGYlMuGZpwyEu+QWkKeC7XxhNMwCTLJ
	uaPU5MqNjqBgiAyQXU0QWHmmzPQMOzLnI/UjFQ5NJZzjh2npCc+fielVppcH//I72lhXOZWIybRfo
	0dveQWCXamq33ilr+Lvfg7VBEyAVXq7EVX7q9Lv92lFiLA2sQH5VORUkJ2iy4bPJyQcHbk0h8Ke58
	eCFecUrW5EIibH2/l0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx7S-002SwX-EZ; Fri, 03 Feb 2023 14:32:50 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx5x-002S1b-Hi
	for linux-snps-arc@lists.infradead.org; Fri, 03 Feb 2023 14:31:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675434676;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bBuUxRqwVpT90qSSvu23sLwWbKqZ02KC/SRu5tcTWNA=;
	b=KoCvTALGset8w6k1Si6CZ6l/74I0+l5J/fxz9/c71cc6sQogROtaYrOAQo01YgoYvBfzrC
	q/3LKjhGqMHX5kY8yrNk80Qy/RpbK+qE8oRrud0H8y+CB6t5xX/mDDkf3Jcvz8Ofnv+gqE
	Zxtn52h1d7tdsFFEMfyeGja/aYjxP64=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-f7FnOkkdNcmi_f1eUvplzg-1; Fri, 03 Feb 2023 09:31:15 -0500
X-MC-Unique: f7FnOkkdNcmi_f1eUvplzg-1
Received: by mail-wm1-f72.google.com with SMTP id k9-20020a05600c1c8900b003dc5dec2ac6so4699842wms.4
        for <linux-snps-arc@lists.infradead.org>; Fri, 03 Feb 2023 06:31:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bBuUxRqwVpT90qSSvu23sLwWbKqZ02KC/SRu5tcTWNA=;
        b=g6ByueJmKw5u2WA/IDYyZyRo9LYV17Abqc7aAYFyoWS87vGO1NZQsLrMiZ6HTS/Ev/
         HbZF08oTryUws0ygGgtBpCdiP9NtEQS/6w0yiKnIzjfXLNroXXayCSQNApvJDkzRwY9W
         92k9spRL8ZcTVUImQwXdTghWGWT5ZTyZeFj+7lkdwHY7HJcW1q9K/WWh/Oezg5olGroa
         DAr8v179MV0o1FbfXp6znLDkXAtjwHPNzMHkobdcgDqmLN7xQDpYbSLFw9k4zcivbqC/
         F4Iai7Y1CextILcv/9SEA5yR2gFr7EiY7mpV+xKijDUmJ/3xrxk58w0BudVfAGrNOvEO
         JL5w==
X-Gm-Message-State: AO0yUKWdB6yIvrMmIhNrlfJ4sXyKoTN4x/IrB6eutKmH5t/PM2PvQn6K
	uZ+voKGqKbd4I/WeMFqPm7+OaXEme0gsAEDrnhVev1U7sQoG2W51e5x1h4QnUFr1E9Yj98qQKWp
	8eCi+rax810ATbpgnYb/SZKlWZO2SBkeU
X-Received: by 2002:a05:600c:4707:b0:3df:e6bb:768 with SMTP id v7-20020a05600c470700b003dfe6bb0768mr2347104wmo.24.1675434673754;
        Fri, 03 Feb 2023 06:31:13 -0800 (PST)
X-Google-Smtp-Source: AK7set8jlKBL+3VH/Q/zFxtw4x3QAOrg1CgHYVk1aVg00PiHMhqeIMC/qbmUMqYVh9aDbNcRdczHvA==
X-Received: by 2002:a05:600c:4707:b0:3df:e6bb:768 with SMTP id v7-20020a05600c470700b003dfe6bb0768mr2347047wmo.24.1675434673459;
        Fri, 03 Feb 2023 06:31:13 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6376.dip0.t-ipconnect.de. [91.12.99.118])
        by smtp.gmail.com with ESMTPSA id w14-20020a05600c474e00b003dfe57f6f61sm2479833wmo.33.2023.02.03.06.31.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 06:31:12 -0800 (PST)
Message-ID: <862cb71f-0775-916d-b0c9-5247f772d637@redhat.com>
Date: Fri, 3 Feb 2023 15:31:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 2/4] m68k: use asm-generic/memory_model.h for both MMU
 and !MMU
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Brian Cain <bcain@quicinc.com>,
 "David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
 Richard Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>,
 Stafford Horne <shorne@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vineet Gupta <vgupta@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-alpha@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, openrisc@lists.librecores.org,
 sparclinux@vger.kernel.org, x86@kernel.org
References: <20230129124235.209895-1-rppt@kernel.org>
 <20230129124235.209895-3-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230129124235.209895-3-rppt@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_063117_716705_23FFD082 
X-CRM114-Status: GOOD (  10.11  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 29.01.23 13:42, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> The MMU variant uses generic definitions of page_to_pfn() and
> pfn_to_page(), but !MMU defines them in include/asm/page_no.h for no
> good reason.
> 
> Include asm-generic/memory_model.h in the common include/asm/page.h and
> drop redundant definitions.
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
