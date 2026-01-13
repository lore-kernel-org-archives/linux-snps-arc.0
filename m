Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2FDCD0C844
	for <linux-snps-arc@archiver.kernel.org>; Tue, 13 Jan 2026 10:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BMxjoXJxufNmhQBQTzg0KGdFYwXAFOdcKZuIxdPT8G0=; b=yetGXDWFQAbjFR
	hHl0wIrf66RHyRwb2lgbGTHZM7jSTWPfXe/G6XeXmI8R67/SZWrvSH+p0noqSnYLKXJwPxoWGNf6H
	u8+NsSlrDUcBpjTjMoHbszse5LbpikEIDIlddYF0Er4/LWL5VzEeaMO2BF98C+G7hjDx53XeBDljW
	jv+P+CmK1lSfOq26YuBT4XN5Y+B32CIcbAq07r2iWFe5pLBunS1YEcNUyWV3xPhDauBtbGtZMOHIA
	uFDxhiMTbz0ExpJaG6H72uKA3kupU6tXCjaYKAKZ5jEJB2jNBdbJMYeuyU5RoWFH4VDGZChnAwjJp
	k8ZxkTLQ0LSpDz+c5qVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbiw-00000006ukk-2MaA;
	Tue, 13 Jan 2026 10:34:06 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfbit-00000006uju-2mz4
	for linux-snps-arc@lists.infradead.org;
	Tue, 13 Jan 2026 10:34:04 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3831c18b23bso34739231fa.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 13 Jan 2026 02:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300441; x=1768905241; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=UHzC82RKzv2fhsT8PML23/RWcUJH1SaVCy8wsK77Ir3Gul4T355o86pqu1t0WbdzjU
         b2ExYv1bLfH2nNHv0id/LU+IKo4z+6VdwaNgsQ+QlCwCTeK7FbOlKo4nOGPfqWncC3uU
         8x1YNrwGq28C/36xwQSx5wrBq+0Ttyc44a1jPvNtzmlLWZR1aWjLWh1yiUiEA1afc1Rd
         ttk0ea0O1nmOgMkT/NhSAf34dZHR0Tzs2eswJR5BnvI5Cm5zjwf/zDhA4FKujIzW8rgr
         rN/MEV3INFMnBVJd/AcUsvUjRHSC3+MGuCIXEpAnweUjzh24c5bADWmfBVmPgbVjWv43
         8x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300441; x=1768905241;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=f3izUlEfeOqR0+O0X3ntb336gZHRADKekiI/EENvKSV48FUjwxi8h6EEIW9IV+gGpt
         GrrrUSiz7qMTFNrPtFu3gxqhoFze/BSQq8BAvum2EPOwmhczVxjI0Fj8yt5uIhPL/5AV
         iFZ4IFi9BsLWuIVnbiLmeOjqa5X59pa48Ls/9/WoDDv+G/LcNIsjoi3uPm7C5rLNqGOY
         WBUAp2Wy182vOGv8BXDyFtkgFVze8UTnNxEtnxk5kLfbMI3I3I5FEP7N8qlDjdlXa8hn
         aI4txdTLB+7ut+bvccy0DAESJG3K7AJjTeCAr02XfD88ZkiwjqvNc+vJKYAMPQ0AtabD
         CYdg==
X-Forwarded-Encrypted: i=1; AJvYcCW7MGe8frG8ybA2DTt5hvimZOePZ8DuWtdDGKEKsnM7x3cYSYgtpjKJeoODCG/ZTVWpqdipnTKXk4X13lVdZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ+nHA3BgnFlUDCiP74WftLh8ZTXPv9lJiGaBuwLj0x9eXxWcu
	+GPPLhXDS6fyiv0O3L4IDGVgg59uLta+YhYK1tA0LfDspSXl0DLs+5/p
X-Gm-Gg: AY/fxX5uOPr6Sxhm/UJ6+FG858idlS333DyNcU9dZMCSr7rRI+DzP0c67dnr5hjINTx
	6Gu0zq/OqUVSlM1o9/XyVr0f/WpjWlEugEHYSg560Bd1Ij23JfaUJMSY/orsuot7rkmAs8TraBE
	NQvKNqEaGl+fXhKmyc83fQth0ZQBVWfyApSLgR3Ug21Cijk9jaIyRNgpCn9SC66v9dc3QxTq2HV
	zyG69h2FczAOeGxlC2SlWKQR/+sj4rOvjQoXh7Blsomp1I+rp9gwdhe5lV0Dal2kOz3U8DgKw7L
	DUCSrIW063+HIH9KH0Wljd5p2yQ/CrGivfKEL0cNrWoQfGWJgGlpBi1oztWl6LXqiT194lhiUnG
	7qL4qkJCOsWkidUHDQm6vIy4kXGm1OZlxmz67zxFE9S2V+VFGhQSQpgSic+VLndMrk1XncIzv5e
	q3EqpItsWCeNtizUatSZwzx0EaVqZMThnPMsbBDykHQWkVNgU8jOzNZ8oJ7Q==
X-Google-Smtp-Source: AGHT+IEOoK2sWcGzQ5k4NJjsFR/RmdeWAB9vvZrFfNJ0u+S6dsEFK74/fdYnqiqEV2XmHMt6sJ390w==
X-Received: by 2002:a05:6512:138b:b0:598:e851:1db3 with SMTP id 2adb3069b0e04-59b6ef05760mr8236951e87.11.1768293628066;
        Tue, 13 Jan 2026 00:40:28 -0800 (PST)
Received: from [172.20.10.9] (mobile-access-c1d2ca-216.dhcp.inet.fi. [193.210.202.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72f3ae82sm4416299e87.71.2026.01.13.00.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:40:27 -0800 (PST)
Message-ID: <f861a1c6-7ec7-477c-bc42-f9aaf6724bed@gmail.com>
Date: Tue, 13 Jan 2026 10:40:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
From: Kalle Niemi <kaleposti@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
 <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Language: en-US
In-Reply-To: <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_023403_713978_4890FD5A 
X-CRM114-Status: GOOD (  11.02  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gMS8xMy8yNiAwODo1MCwgS2FsbGUgTmllbWkgd3JvdGU6Cj4gT24gMS8xMy8yNiAwMDoyMywg
QW5kcmV3IE1vcnRvbiB3cm90ZToKPj4gT24gU3VuLCAxMSBKYW4gMjAyNiAxMDoyMDozNCArMDIw
MCBNaWtlIFJhcG9wb3J0IDxycHB0QGtlcm5lbC5vcmc+IHdyb3RlOgo+Pgo+Pj4gdjMgY2hhbmdl
czoKPj4+ICogZml4IGVtcHR5X3plcm9fcGFnZSBpbml0aWFsaXphdGlvbiBvbiBhcm0KPj4+ICog
Zml4IFpPTkVfRE1BIGxpbWl0IGNhbGN1bGF0aW9uIG9uIHBvd2VycGMKPj4+ICogYWRkIEFja3MK
Pj4KPj4gdXBkYXRlZCwgdGhhbmtzLsKgIEknbGwgc3VwcHJlc3MgdGhlIGVuc3VpbmcgZW1haWwg
Zmxvb2QuCj4+Cj4+IEthbGxlLCBjYW4geW91IHBsZWFzZSByZXRlc3Qgc29tZXRpbWUsIHNlZSBp
ZiB0aGUgQmVhZ2xlQm9uZSBCbGFjayBib290Cj4+IGZhaWx1cmUgd2FzIGZpeGVkPwo+Pgo+PiBT
ZWVtcyB3ZSBoYXZlbid0IGhlYXJkIGJhY2sgZnJvbSBybWsgcmVnYXJkaW5nCj4+IGh0dHBzOi8v
bGttbC5rZXJuZWwub3JnL3IvYVZyVURlU2txcVk5WkN0U0BzaGVsbC5hcm1saW51eC5vcmcudWsu
Cj4gCj4gSGVsbG8hCj4gCj4gSSB3aWxsIHRlc3QgdGhpcyB2MyBwYXRjaCBBU0FQIGFuZCByZXBs
eSByZXN1bHRzIGhlcmUuCj4gQ29sbGVjdGl2ZSBzb3JyeSBmb3IgdGhlIGRlbGF5OyBJIGhhdmUg
YmVlbiBidXN5IQo+IAo+IEJSCj4gS2FsbGUKCkhlbGxvIQoKSSB0cmllZCB0aGlzIHBhdGNoIGJ5
IGNsb25pbmcgCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0
L3JwcHQvbGludXguZ2l0L2xvZy8/aD1odWdldGxiLWluaXQvdjMKCkJvb3RzIHN1Y2Nlc2Z1bGx5
IG9uIEJlYWdsZUJvbmUgQmxhY2shCgpCUgpLYWxsZQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4
LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
