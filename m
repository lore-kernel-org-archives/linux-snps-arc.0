Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D02C44501
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 11:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jykcN+kKDmcqkBU3e6niRzikWpYCTLYZrPKNT+Vxeas=; b=gEr+WCW3Gsd17+
	g6do1J9Lr9UBU9iHLnmejuVIQMo14CiPFyj9XHFLw7XNj8HzPlb/zu/Wmjpj4+ocs9OzS9oOUpYJy
	U6evyaoacZk/Hjvk38Lg4HReaQGiuiW1oy6olkJnVxtd6E8HuG4LobkmfvIJnM9brYx9CLylzRXDw
	ElC4QbVQ9ORlEvqsGOFhGzpPmBULQ+KvECcK1GysQ/0EPinhmgrLQ8DV47GfecuQvISZLeCOwN7Uv
	HxwkyeAbn00BA07qNahZJJgdPoB3S350D/bLuAbfSg/dS+e/EPxE4GGyz8eoPXpB6AR6sXoFQEb1/
	EY6TSKRzQdnUSgv/MvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmkX-000000027nB-0Mvp;
	Thu, 09 Jul 2026 11:17:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmkT-000000027kk-02rf
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 11:16:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Awt1n1602389
	for <linux-snps-arc@lists.infradead.org>; Thu, 9 Jul 2026 11:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=; b=bZBcJAam+ibbXFwx
	fYme4cr8sBqjGZ8/bhY813m3zZdemgRcv+ZZn5hEkMKaS7vw0Lsk0C+lZaMW/4N7
	48Ti3b9W5djrMW6C6sRvr/fRMwvlr3Xwdk0O8mST92o98b2JRkz34WzfXmdlRdyc
	+GNzKHdNyJRx4XFA9Y/FW2dL+68kjj0jsC9rEzLvB9U2wtPREHvCZncHnjBH0nco
	DqfIf8EOVkC/PQXn3R9FFwNfO+c4fAiAxBDB9r3vKIUe0k0qjSg4thZ00H8jr+97
	7VzXtBysfy4u+kGoa711kKXXJoacuD/Fbabaj49b91/ZVeI4dz7AgvccLaeW9YDn
	oHnuIA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa6p3s7c4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:16:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso8967871cf.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 04:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595816; x=1784200616; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=;
        b=Mm6+MDzC4XSOzyF/BU87cVEU5DQi4Us5FswUTOiB4exVOzb5b5ZXAEmUbFABuMewsE
         HrmWHWfmI+HbbR7wUbBL5rn0dUDKstCPczdZIFrt2LV0Aa3DQZCCcmFHN89tLwZvZ/Tl
         FeEtSdUpDF6KhumFo9v1A1acNHb74zuC8rq5aF+jLngzs4mFroVqBlX/zd+FEML3AjmA
         EMgjEf4gLFeGaq5iK10tjtlE8kbj+sgk17XxHMq9L01QqAEwdZJhIOJ+5VzCWF4B7f3Y
         hfz5SccOI1OBFaFkFvVENO05yLoza40b/37pJg/ZGKwxc2b5fIxDBx1+HhZfKeMuR9jt
         lcnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595816; x=1784200616;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OP+BLCmg7XOu9OIoY1nTg278DC95imbUOhUvbiFMd6M=;
        b=AYh7C/rJzMgcr833bGXH3m+8T02yOi5/N3kceViWSLD+HEOYd2el6g6j5Jc0RZvVn3
         aZ166jLWJoNXnTjXBflwSzJIRDpGSx3eQOWq1p/9oGjdWOXDBUlITTKTyxL2dK4H7YB1
         cCI/UVdGR6Eg6UR0gX/tF9g48AQxESFkBA6u78Wry+bwEpf7iRxvbUfrAHHPV48dhJFH
         9PFX6t9/hEVITIT3nKN6eO5sSRhL8Qt7PYwHtYItNt+Zigp16z4oAkeCudgTn3xfcNkb
         5aSqBKR9h4EqsOHQ8mv6YsFusXTUtLOfcV++e2V5Ym4KvErW41N2iFNpilrWujuWB5c0
         Jasw==
X-Forwarded-Encrypted: i=1; AHgh+RrQzISl3+dsnGSY8MJ5xLpaPzHFgqz/nuR9/I3UZzA0iOKuKsYNljPrVPKsBBm2aSFO4j2wjgB6Y6xEygu2ZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKZ63Mo0YdOypwie6aoqPLSSJ55WnU3IkRBXQzeXODkFkI64DS
	zz1B9UNCVBOp/DaJxrsf2SFbJtlXtF4FSSgLWs5J7BA5XZvg23W9glpEQ7nk4Pb3xVSPMyZp7bZ
	S7lmuwc1CwfgOZLmM9cqbTZ9lO+3nLnz2Kx68vnsYXgY3Wm7rNiMsLNsjLVEFuwiwxkdFLlOS8a
	Q=
X-Gm-Gg: AfdE7cmc0pfhqiL8FCuYHf+9VGVhoYWBXJh2hu4hTq/4hVWq/Gxo1eiZlDKVMhi+vuO
	K8g0cBNIiB3wp6s22tW2PNpfDzEXj4DRNdwDY2DZlp/thMNGxD4+KrzPbQ/JqxewycPPrfzkG3I
	pFA5Zz/9xoa4glFQ0t7ii6JT2FvUTF0hQkDiuYDot0WVOZIgAxxfsabvtGWPfHYO1OPBlJw8aIi
	sbY4cvU3zTekY9WlnHM+3uqcFp1sHSnVuKAtZd5xD+1IdYib7x5i283H9/6aglss5Q66QDz5Qd9
	iXTcAhgikCqW4paGLyV1VGAW22oX3vQyXrq9YN3lmAqtaiTP50bYwE+Wbh9whnQFUzoL6JwreiG
	l6RLezNPtempz7x+L7zky6feXV8rLf5UljX8mnnUPAXahSYHEM9yy8t6Gg1O0Ug==
X-Received: by 2002:a05:622a:1cce:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c9ba21545mr21236271cf.41.1783595815661;
        Thu, 09 Jul 2026 04:16:55 -0700 (PDT)
X-Received: by 2002:a05:622a:1cce:b0:51c:558:cbbd with SMTP id d75a77b69052e-51c9ba21545mr21236071cf.41.1783595815288;
        Thu, 09 Jul 2026 04:16:55 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d8410sm51612968f8f.15.2026.07.09.04.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:16:54 -0700 (PDT)
Message-ID: <b2ca1416-e2c1-46ac-8a26-ce671c76883f@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:16:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 06/18] riscv/syscall: Use
 syscall_enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Sven Schnelle <svens@linux.ibm.com>,
        linux-s390@vger.kernel.org, x86@kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
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
 <20260707190253.974626922@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190253.974626922@kernel.org>
X-Proofpoint-ORIG-GUID: 4AOuURifhGuK2SdLvXI1iVqqwH08ACYn
X-Proofpoint-GUID: 4AOuURifhGuK2SdLvXI1iVqqwH08ACYn
X-Authority-Analysis: v=2.4 cv=TPh1jVla c=1 sm=1 tr=0 ts=6a4f8328 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=_O3DOGVWAAAA:8 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8
 a=DoJJhcVa48uSEvU2-xUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=2TKV-7w1aU1AVAwN0oqT:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX3TIUhRnCRcxC
 yarZODVmr3gL1gamn1OkN6MXzdQlC/VpoXMYrNVwCkETP8u6qB64XxDZ8Z909YC14pU6Nyc5BV+
 7zDAZVUvU56worLbqyOsUTaPS42lTeY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXx6TZstRosbRj
 qgK4dd2XAreQ8w1tiZXeH48ZR4oMeXeWwFD5lgNrokJBPOg5zesruwMWGESUQ9dVsNgcCZnPpUd
 w1Z9Jmhe6GtzyfRmwsUY1EKPJ8BpGOa7N+3vD0I2rJs5GHmlXKnVlOE+okM1IGPq2Toptw80nCt
 bhcyr+tHplXl5vdnKTnq7xdRuBUD0iJZKDQBHo/T8ZXvHYXVdG4MAdWPFpU7fHCWCD+jHkaqF1u
 JQA76nQ4dUqZ3q19CBcjKcWEZbIVx1sOFkSg5HEpttz7RfsXudFF3V8HuQyqAh60uVtVX5Q6CFA
 YWixC/gJ7ChHwmdLh1WAqIrSumyUhTV3qU0IiLbt/H+7mivcfXd7ICLXh6vW8zHSpuafUEj96z2
 ZNdk+H9/SSFQGMbymSSTOgAWRwGDBoMOBhCjo7Vj2v9UGX435HPnPomLUsWiO1E9M5d2UzncBOZ
 SkI/GHIMmFZTkJ2ztfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041657_056597_06FF84FC 
X-CRM114-Status: GOOD (  14.18  )
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
eG5lciA8dGdseEBrZXJuZWwub3JnPgo+IENjOiBQYXVsIFdhbG1zbGV5IDxwandAa2VybmVsLm9y
Zz4KPiBDYzogUGFsbWVyIERhYmJlbHQgPHBhbG1lckBkYWJiZWx0LmNvbT4KPiBDYzogbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IC0tLQo+ICAgYXJjaC9yaXNjdi9rZXJuZWwvdHJh
cHMuYyB8ICAgIDUgKy0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBk
ZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQaGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1k
QG9zcy5xdWFsY29tbS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXNucHMtYXJjCg==
