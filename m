Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A04D9C43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lLzMfG4qg7HHNC2e5K6zqKoa1VPlLkqjoTbqRGSFajg=; b=WSw04hiqiC8260
	k868/DnWAsmhsXVtDw2MDBHvGcuGaJi3H8xARLtuKuVIG7YyF+CBBMGQDFXUHybM+m+sGHWHtgeo4
	gL1lud20P+DnTIq4BybPlz4+dxATwyu/CCo2/zR6U8Wp5rl0956nNZLk8gWdA9+6KeHMFMGGZcAew
	BblmUWHovfgZ7PviGFBZVag5DXSi6dV4JXE+CvSLm/a1ZCZE4wTxiwdkoAy0vbWrkj4aGcAbOB4JL
	wVbWFIY0wyHrEe3Vb51DQ9ulUdnMtPCXjDCmhhyal4ilcpuhKh9os3doU/D1t1bSqxYK3KEQRMyjQ
	jgET5cUvCGq5o2QZE2tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmk2-000000027Zd-1cgP;
	Thu, 09 Jul 2026 11:16:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmjz-000000027XD-2Z5h
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 11:16:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxCAq1521422
	for <linux-snps-arc@lists.infradead.org>; Thu, 9 Jul 2026 11:16:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=; b=i6Z+l6cz0ADxMir5
	PP7gquUEvOGqieG+lf85k6tqb18XN99Vb/XbQueU32Nh4DFYdvrk7j7dFspHsXdS
	Cy7w+CsZ/lI338HKy004q1RoAkSXUYbZGedzGtf6/R1/0ogaog7QiT/r0AH6uhhW
	EGub/EAkoHwsQwiSwXadb/oYPAyoLb8nSMPbvA5/LtqwV8trHzPhgOS4T3OKYTVp
	y5/p6PBjRcCgw7xpwdmKpUFT5d7kIO23k48hxSlZ8uRGHGGnWe45xji+gjzdUnc9
	Wyi3IdVy9kYk4bNta4UN3ybii4hmT7hogdBdgOfzXklVyIt2UwzF5HAMNiWsF/IF
	edCxbw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwbw0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:16:26 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c20762d21so20472631cf.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 04:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595786; x=1784200586; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=;
        b=dRvZk4vC2hQEd/7eCjIOOrXm/MEWVOnnjdbFTLxihiHkjuWdhVu25tjiQwWIfwiMWa
         fNSkcZR/Of2Psr2O+mfkCeP7fJT7wDKHS7tBtxiOd4R1xO0ih4rbljuOLlSKApSQvkrE
         c88w56obiTK55QvVCheTJk3jPmv2E5cYPFNVGKtwnbl1JsJh0bXnxXTLQrMh7TWF3KBk
         hZEwWl66OHceQJielw62MJleMqPRMoElMy+n4lLy8vkS/mDIXhhsxlL2V14w7RZPrZfl
         dbaBeot08A0NIiTmrnhzLWRaQn2Hn/nfptedjYHqbZGd3yRGu7J5U5L+LQZpZP0xz7Mf
         ZV8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595786; x=1784200586;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lQNxQw6rO9fLZuzYn+ybwybDNA8F5Y/5chm6JwlKasE=;
        b=GSnsODWaPJ9MsKPlaEGhzPxQDyAe6VdzLrsg8MZ5/n6CjQco2Ti4VX903fFYGINE2Q
         V4LHDk+WXjALPyz5Yd+qovPXvv5Bws0FV+lzbLxhExs0ipC5sPJ4mXTkIUSGJ/jGUd5/
         eBI0ro30Mi0nTY4N5vbK3UvZZCoybxb2iWNA2ps0g/fpVdTK9y0RUH4YcgFcYu/+2vwt
         GESQLaliHK1P8p+BsU+hJzswa+tpR5hZLVyBr7ue/WtbxaM/zJw4YBVAVBBDdy1YKA47
         S975mMiVxZTj1aj4/2u8ApzyRviBxh7GP/y5SjFZJdg7PhqEhEvKOgHwLTDUNNMt68jy
         ECOg==
X-Forwarded-Encrypted: i=1; AHgh+RrsnYdMJ/9Dt27e3QeY8z0ekPBPKHGR43Da5IOr2omabuwuY6EOv5h2dbMbv73r+hDcNgzaxpYDo6lyElP27Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzIBMHr1qjPokWuwNYgpzOABvFt1vEsyNJh3/me66Jd0dpCWLz5
	QVigxKNIV6vwqM6SvMcf1qOOoGFuwQPeF3+EtC2Cdql54fULyPDFYmTvJfLSNvQVIwD2D0ZnCiV
	o2C9RAy23TQtoUMDwUxns3AsprLmatGHzw3yMIlC1BOOrehtgzvyYrm4OOQ+Msh60S4bJcppqXB
	4=
X-Gm-Gg: AfdE7ckv4hmV4y0OsXodq6JW74w8XWNJCyBeQVmpLXNsp2Y7ycvGMeCV2oTpBacTtjn
	7IMy2CPnqnRVzWW08oenQLk+LzKXnNHAjEh1kHe9l9FD5tjsC34+rTaWh+iHKVtTcTXeafHz2uH
	Z7AQaFsC1OKUmFqey6IY+MI0089n/YvYZLZH2CUzdVp+jpWKv40cN8A7uYtPIUmFfkaGxa2oDTq
	fFbrDzE/CtO4VNyjRHkjlP6pMpRVbNlRdxK1WMqJEYjUM+IH6PR+pVu6TD1RF3VBoSi74V5+YHN
	lk6d16jqrKjrE0IqnaDNOEfpIE6B8UgAevv/RK5fcXVIDQhUqPIfmOkxJTP6TXpee276X79SO3F
	pKjH5zA40G1vg1uaybmkqnMJKQbGeyLkMz7L+7buoC7Ro4YSLiNwS9T6WTWLNKQ==
X-Received: by 2002:ac8:5a94:0:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-51c8b3033demr72818461cf.28.1783595785879;
        Thu, 09 Jul 2026 04:16:25 -0700 (PDT)
X-Received: by 2002:ac8:5a94:0:b0:51c:22c5:daf4 with SMTP id d75a77b69052e-51c8b3033demr72817641cf.28.1783595785396;
        Thu, 09 Jul 2026 04:16:25 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1d8cdsm54261424f8f.1.2026.07.09.04.16.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:16:24 -0700 (PDT)
Message-ID: <b45abac8-0e8a-4005-a050-a0d37e1c8e2a@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:16:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 05/18] powerpc/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jinjie Ruan <ruanjinjie@huawei.com>, Andy Lutomirski <luto@kernel.org>,
        Oleg Nesterov <oleg@redhat.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Helge Deller
 <deller@gmx.de>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>,
        linux-arm-kernel@lists.infradead.org, linux-alpha@vger.kernel.org,
        linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
        linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vgupta@kernel.org>,
        Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>,
        Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org,
        linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org,
        linux-arch@vger.kernel.org,
        =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20260707181957.433213175@kernel.org>
 <20260707190253.918861529@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.918861529@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX2a/v70k/NnuB
 vfrAu1wE9krbvg5YYP5jc+PVj6kDxcVBFuw3sZyB4xmBgKtXe5S062f5pum3OnX6O5D0V1/tGJm
 Qdm4gkw6ZlfJAnuEsIblJHO+2TD9TxyzHLn8OfCz+/q+Vquvn8I5Po8J37tNuQTVi/2pdheOXbi
 t1a65VKYroHdQjY+4vwBPlTpAuUr2k5zvyA7lXx+mFdouvKzuDcl4ptln2A7LIARuiBs3o2B5R9
 weymmC9S59z0yf7ZPbQEc27LHsZq6kYLpQJ8lC17iPYXP4WU6zZLMIGKWLQx2FpPo9cXnqEtMpL
 jpeXP++U2X7j8gfPpB5/aAdi5SXqiq+Cb5Ow6Ag4ROovi9wjCeBnAiqxv9843ZxYi5sL+OAIPoR
 ma5Ood3aWAVCSZCTpv1L5EiUnAtu5MAEwwHP2Z9p+kBHVBXjySoj5KLByxuZsAv+vWfkqa+GlWb
 72yt0ITXSQlKyj6iwaw==
X-Proofpoint-GUID: QQQpfEnys7IMJ2KSQpOd7Ud37K4LriR7
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f830a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=voM4FWlXAAAA:8 a=EUspDBNiAAAA:8
 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=IC2XNlieTeVoXbcui8wp:22
X-Proofpoint-ORIG-GUID: QQQpfEnys7IMJ2KSQpOd7Ud37K4LriR7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX/gdKXDvuv+gY
 hgPygBzkqNOe6JdsCsSvh41gZetCg8OHhtut26whqUaQ5a4k2NGvOC1c3yS+diiLiybqHGpoRN2
 TtQY5HOxIrpl0tB1iP+VVAYbDO7V+/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041627_762576_F34871B5 
X-CRM114-Status: GOOD (  13.80  )
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

T24gNy83LzI2IDIxOjA2LCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gc3lzY2FsbF9lbnRlcl9m
cm9tX3VzZXJfbW9kZV9yYW5kb21pemVfc3RhY2soKSByZXBsYWNlcwo+IHN5c2NhbGxfZW50ZXJf
ZnJvbV91c2VyX21vZGUoKSBhbmQgdGhlIHN1YnNlcXVlbnQgaW52b2NhdGlvbiBvZgo+IGFkZF9y
YW5kb21fa3N0YWNrX29mZnNldCgpLgo+IAo+IFRoZSBhZHZhbnRhZ2UgaXMgdGhhdCBpdCBhcHBs
aWVzIHRoZSBzdGFjayByYW5kb21pemF0aW9uIHJpZ2h0IGFmdGVyCj4gZW50ZXJfZnJvbV91c2Vy
X21vZGUoKSBhbmQgdGhlcmVieSBhdm9pZHMgdGhlIG92ZXJoZWFkIG9mIGdldC9wdXRfY3B1X3Zh
cigpCj4gYXMgdGhhdCBjb2RlIGlzIGludm9rZWQgd2l0aCBpbnRlcnJ1cHRzIGRpc2FibGVkLgo+
IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVp
eG5lciA8dGdseEBrZXJuZWwub3JnPgo+IENjOiBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJt
YW4uaWQuYXU+Cj4gQ2M6IFNocmlrYW50aCBIZWdkZSA8c3NoZWdkZUBsaW51eC5pYm0uY29tPgo+
IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZwo+IC0tLQo+ICAgYXJjaC9wb3dlcnBj
L2tlcm5lbC9zeXNjYWxsLmMgfCAgICA0ICstLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMyBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURh
dWTDqSA8cGhpbG1kQG9zcy5xdWFsY29tbS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4
LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
