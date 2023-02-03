Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7673C61DA4
	for <linux-snps-arc@archiver.kernel.org>; Fri,  3 Feb 2023 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/iM3A3T88pIRXtRuxPfDU857D0WGvhRelndW7fz45A=; b=dHYG+ORBcyFQui
	8Iz4XDbfuiRRo1AtbYZa4V9YDgD7WhywYUqcpwFi9sJXghnejAmh1BNElo4edDH2KjZsHIPF0eE+r
	LUkK4ouUWmejHHxpmu3SaflhKC8/h6fp88Z+Xa/Nm1OpFjIYMNDvP7ObBZNOBdRL+3E0HAK/e9qdR
	rr67Ns1yDTJ8CgkmZRmakqDkQ7SnZj/HN8zgLEoASWPBudlb7GV1BWgZYQ2XqF+QHJx7u2csJeoWH
	f7zhydDvkBnbtTWUQUWHg6J9oPPOnAzzx+Kf7pl6sWNLp/7ZArzSRmsK0q972rd3ICD8eThc8yJC2
	hFDmz3vjkWQ8wnGnzBsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx7H-002Soh-4E; Fri, 03 Feb 2023 14:32:39 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNx55-002Rbc-Ve
	for linux-snps-arc@lists.infradead.org; Fri, 03 Feb 2023 14:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675434622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGqA/t5BHooNtKKmgY/P/RvUeTIDhJpfv4X01I3UuzM=;
	b=PR2LtK/eK1TWnMYbhq6up3Ufi3rHTlb9Zisx59+fyR8Q7nQCsBmHOMFeZFJgop89dZliQz
	mlxbGY48vNOqavegPTosoQdEsrdqSumeLTt5QQ1GbrTqJpLUFibsDv/XpiC1EksN1vqGi+
	GOye0Qe6lY1RPcZ31GnmLJAIAlIxcY4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-491-ExW4EQwPPRObNFcwhbthtA-1; Fri, 03 Feb 2023 09:30:17 -0500
X-MC-Unique: ExW4EQwPPRObNFcwhbthtA-1
Received: by mail-wr1-f70.google.com with SMTP id i9-20020a0560001ac900b002bfda39265aso713489wry.13
        for <linux-snps-arc@lists.infradead.org>; Fri, 03 Feb 2023 06:30:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGqA/t5BHooNtKKmgY/P/RvUeTIDhJpfv4X01I3UuzM=;
        b=RugO7EOapPJJ80AU+fcTMwvJ4//3VFnhiseuJHVSEc5I6gjOUJd/zcuYPYGlacvQDy
         VcO+zNrmyw8FzAZcx/w9Uim2Oy6ko4yUwWgEOMYOOaVjm6hMox+XL8v9zuxiMehqOqHC
         HnV5y5oLaP+5mRBgOHUamrWCRpWnFWCdoWhtPR5gK7iUH3f7PLh+ti4/7CBCtG/NjVeO
         abMWJeIOs+fG9/rGHbgO5FnlxwX6xV57MCUHp3qNQDqjEUUyXooUZQ+Z2HI2SnV+uPVM
         3w9C5WSyzTF4hRgejRZt5kNKWAqwINOsX/s5XEmczIhzDl6wNn1Hdnf8R28NMGhy5uTP
         MxFw==
X-Gm-Message-State: AO0yUKXzXCPO+Ocsii9LRMZlTT/B3D21gWyPRRE2oFhUWeWVqIkvuHGk
	A45m0u06eOhq1nrbBZNB3ahjndNrCgiSL3ETi83GqSliKs2Jcwl7dvjmv+quyO9HfJkyUxU37FU
	Y46z8uCDIej1EiblCb3En0Zg/rDzx+zU6
X-Received: by 2002:a05:600c:3588:b0:3df:e1e9:200e with SMTP id p8-20020a05600c358800b003dfe1e9200emr4472919wmq.39.1675434616196;
        Fri, 03 Feb 2023 06:30:16 -0800 (PST)
X-Google-Smtp-Source: AK7set+3Fxk3nALXFhpoXy/lSyMSFcdmxLuZvgb86YYfx4M4JIQvKCJs/tKTkc3VpDPsDt8toFavpA==
X-Received: by 2002:a05:600c:3588:b0:3df:e1e9:200e with SMTP id p8-20020a05600c358800b003dfe1e9200emr4472869wmq.39.1675434615896;
        Fri, 03 Feb 2023 06:30:15 -0800 (PST)
Received: from [192.168.3.108] (p5b0c6376.dip0.t-ipconnect.de. [91.12.99.118])
        by smtp.gmail.com with ESMTPSA id h27-20020a05600c2cbb00b003db12112fcfsm3203111wmc.4.2023.02.03.06.30.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 06:30:15 -0800 (PST)
Message-ID: <569308c6-558b-de6e-1e98-2f50c1c56755@redhat.com>
Date: Fri, 3 Feb 2023 15:30:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2 1/4] arm: include asm-generic/memory_model.h from
 page.h rather than memory.h
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
 <20230129124235.209895-2-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20230129124235.209895-2-rppt@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_063024_125638_CF4BD45B 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
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
> Makes it consistent with other architectures and allows for generic
> definition of pfn_valid() in asm-generic/memory_model.h with clear override
> in arch/arm/include/asm/page.h
> 
> Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
