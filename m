Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD24C43458
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 11:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vJQGepw8JbFnb/MX7DrrC82DF3etasIYP4E2E2HvNXA=; b=ZFbJdyS+dPshI/
	vC0u2lcrftevQ28PKT7jJWuS6xIHwx1EZUIQ9UUtChmRfwn2LDlyWBlfguu/Jrh1g0A2Qx146aNpp
	j2zR5e28SAyjfGiqDhTM9Gdx/WTTK+D2nYmWL+/0G9H57W4iNo49NB1pDKy6guny9mtcLlfJYCXhy
	604yVlVuAmDVn0WPK6Q8GYlaiUYg+xBtRmh1drR7PDHu0e7Sv49kKwC+vlNg8towrtYJW5AV5dEsH
	UEzwU/Zs6DRoAvkX4MarINtWIxaBntZ8qf+jIxH0y5dIXzbaUq7t0eEHMo5shuvJrMtUu4GrKLFsv
	t/AN8WxzEUAcWHhiRK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmlm-000000028Eb-0f94;
	Thu, 09 Jul 2026 11:18:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmli-000000028CI-3gEM
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 11:18:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Awx3N1569638
	for <linux-snps-arc@lists.infradead.org>; Thu, 9 Jul 2026 11:18:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vihb0TqYNakYFNkvFgdqTcLu+5oolASwgMBC4TOzm2s=; b=fyY0pNu1SYakkEnc
	jiua1Bz59Z/HxTO6ZZj7/6VoWVtUtY1ICmo9H1Pd2QjrZWC8gJfOm9T5qkA9XEc9
	zZ/LvhTR9YL1D4FRKeeUPeBJzIH2ig7MkQc5n0wn0ncq5EOUUpyCj9xucWrHafNA
	Mhaf5VX3wvgWTqgyvze8xNYS1i224SoOljNif2MkoC4501PXlkZEU2tlj13tOCVF
	k1OcXw5rO9V9U6F4nqjFTDFlr4SsHrosvOnlojjBDdlvWI+//0MRkxof7+sUSdLM
	DMKQPcPOu2w9XU1PRa+80kn2vAWE27oY8QNhmoRslamfrHh0e5dTRzAtOzXXQfwX
	yQEHaQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq348w7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:18:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51a87ef9713so8501701cf.1
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 04:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595889; x=1784200689; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vihb0TqYNakYFNkvFgdqTcLu+5oolASwgMBC4TOzm2s=;
        b=kqwYUjFUlPP2cf5b3GxZm1vz90hwoBJQoBCdYurR1qKwU5e6SK5pFTTbPMY1lmqzTW
         qg6zCY7tBOrW+hGzg/Nrd29l5r5DiyDzyhUdZ3wEqTdOvKPtzkwqk+Uv30kvXFPn7+Ib
         01Z56hqAUUPewW2dUwW82FQQblY6QJz+n0JxaDZKM5WQWR7zSGlwfaSc/BdTk0PVh2XK
         CSb4Sss/yyFVb/VfCUckpR7BensopuJ+VYb0g1l7IF8ysgY9EbBR/wOwe56QAgk8GFHN
         pLB6ve/kEtYoUEdrrB6O8KG58fRlyRnJith5PNO2twu2csAYpjrmBYPVLduSXZO0XBze
         IjXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595889; x=1784200689;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vihb0TqYNakYFNkvFgdqTcLu+5oolASwgMBC4TOzm2s=;
        b=eGv4tiAlFEY80mDJaOCZWuUBGagaze7ZvMxsbNTZc+CoQmvE0r3qc8wb1/uQ8r2Voz
         6t+m/OXrvGf1JDCFcLI3WHhNHd2FqtZGC8WLKhI1eBcO+dNduHkjMHEIubFQxqJGxYwG
         F+55X+FhzcV/6TBkwfNn43Mmgs5RhSNZwgxO+l6AMFfn5jua/MRmRjF0fgf5tnDuw8kt
         rJLcT4EyldKNlXilKNiv8/8+gC2e/e86zRq5mGHP6uVDKWts4P78bpDj1KdOCxY+LAJJ
         zBQIxxXgMsy4KOAnIhhDZT6RZFJixZRApOw3p4AaZ9O8Rb6Qj6kmlkmIrkXfbhY6vlZ8
         qsOQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4e3rC+e7qvRYTL7pjuYRgqsJ8YrCevMArmvmX/3gADVzupiMfbOJ5Uxc9P4WvYZgiL98xqEfwWtYDejT3sQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxI8z6yzRYgoYlQeR2/kpEsAZMiG+HaglLpHlh/OEzglCqKQDG+
	5yH2zRdMGdxNkmrmEPwzAcRI6bz43edoe5S9E2EPGlU8wZrtjkTfHskaf1z4we/m96sqeD+Ev8K
	kFJPUXJ+ZWhVOhA75BVe8SYpNfAQoxnMQRuJG5pVUKXY+KB3tptFBmGbb1GGZjQ//lnxiDzNXLt
	s=
X-Gm-Gg: AfdE7cnjOTBfkIIJhd5vFQd3YjSTk2HKxCt0/Zqc8PwJxE7hd8px3NeOQM2b07/IW83
	eWGqIg3DHW1zKZE81CgNPDLuKAuH4UdRF6Pdvq6KUUPAAw9+QE+uZw+d2WSkBiu3BGKbaGiPPDT
	RkYjePcTG7cVf3DwXRkOfBC/QYC//FbkvhuqOzN44NeLdF0jQI3VJzbVTG9Bx30zvR7FI1HzJKr
	Bp6hEhuv6ZPqddlQnwRyMUHw8aSnt9ST4wIEJSIKBo9HXMG+WbOTiN1XV8APoGpbNQvgaean07c
	NmeV1cU5/waSkmTIoQmbeQ/gfq6r8mRSt+z7mHj97xxNvbgnxnaS1ZIZ7pW6QqYCfpBZsRD9IYu
	IWLXVOxHUk1axYKjzMQbNXQPCevMiS3z8RE/H/50iDMAikpzwVFhdGibPa6ZSNQ==
X-Received: by 2002:ac8:5d06:0:b0:51c:98f:f282 with SMTP id d75a77b69052e-51c9b9c9812mr22454071cf.27.1783595888691;
        Thu, 09 Jul 2026 04:18:08 -0700 (PDT)
X-Received: by 2002:ac8:5d06:0:b0:51c:98f:f282 with SMTP id d75a77b69052e-51c9b9c9812mr22453591cf.27.1783595888214;
        Thu, 09 Jul 2026 04:18:08 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6d53absm53036115e9.6.2026.07.09.04.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:18:07 -0700 (PDT)
Message-ID: <e89995a7-0da5-4581-bce0-5dafc377e9b9@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:18:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 08/18] x86/syscall: Use
 [syscall_]enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Thomas Gleixner <tglx@kernel.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, x86@kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
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
 <20260707190254.079478122@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <20260707190254.079478122@kernel.org>
X-Proofpoint-ORIG-GUID: zBFOVbHjW920QgS7GLS12hK41esKrkRR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX0k/hsLVx7QcP
 MEawXxdq4lXpSh6aNN3/UkflYS20d5OVAE64IDyr0JXsNGiylkeX13O4Tlk7PaY3Py1SUtr5BGR
 laeMCe2IaeIWZR5I0IqQyHQEcBF6npqxc9PUNRQTZ5CdL5WTNXPutS3bCOJNP48OXfpxVAcyZDH
 iBJDhXf/hCqOFMk45vvZZIMR/f3QJeroahceWleYX846uicELYnBXBEk35TDwfirAJ73eCGiuBL
 PSfmSvOvXAwstqDqLxAkIDOGZ3boMW5NOCb1NEMp5YbsQAlXEI6Z8vWoXjgt781oHX9GP96mCut
 hGHV94D2L1gKwlMp6YObJ6mF29gYZ2K95XVpVjcy9peYRqpUVxwbxG3nGnj8AvIGCd6uwuzIyRA
 JXRWX8nK6jmIVdXTrSJPjEhaNcSAhxBHzWJtQxJM2+nusKvc/nn6qE+ADMqyIUSbyIWHlVYkzWC
 mwyByL129RtH7M1BjGw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX05SCnPCKUdWA
 aKeq3SAuvKoCKznVleDfdh21katQR1NA/2oWnqUQH81OD6Dd4W1NpvZEPxubFHdk+ysI/3bNhkY
 FEAlFxBWU+Rj4i793hw5mgDIUdIgbIk=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f8375 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=wOAZ5We2mjvvK_q5lLMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: zBFOVbHjW920QgS7GLS12hK41esKrkRR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041815_026762_401710A5 
X-CRM114-Status: GOOD (  13.72  )
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

T24gNy83LzI2IDIxOjA2LCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4gVGhlc2UgZnVuY3Rpb25z
IGludGVncmF0ZSB0aGUgc3RhY2sgcmFuZG9taXphdGlvbi4KPiAKPiBzeXNjYWxsX2VudGVyX2Zy
b21fdXNlcl9tb2RlX3JhbmRvbWl6ZV9zdGFjaygpIGhhcyB0aGUgYWR2YW50YWdlIHRoYXQgdGhl
Cj4gcmFuZG9taXphdGlvbiBoYXBwZW5zIGVhcmx5IHJpZ2h0IGFmdGVyIGVudGVyX2Zyb21fdXNl
cl9tb2RlKCkuCj4gCj4gSW4gYm90aCBjYXNlcyBhbHNvIHRoZSBvdmVyaGVhZCBvZiBnZXQvcHV0
X2NwdV92YXIoKSBpbgo+IGFkZF9yYW5kb21fa3N0YWNrX29mZnNldCgpIGlzIGF2b2lkZWQuCj4g
Cj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGtlcm5lbC5vcmc+Cj4gQ2M6IHg4NkBrZXJuZWwub3JnCj4gLS0tCj4gICBhcmNo
L3g4Ni9lbnRyeS9zeXNjYWxsXzMyLmMgICAgICAgICB8ICAgMTkgKysrKystLS0tLS0tLS0tLS0t
LQo+ICAgYXJjaC94ODYvZW50cnkvc3lzY2FsbF82NC5jICAgICAgICAgfCAgICAzICstLQo+ICAg
YXJjaC94ODYvaW5jbHVkZS9hc20vZW50cnktY29tbW9uLmggfCAgICAxIC0KPiAgIDMgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKClJldmlld2VkLWJ5OiBQ
aGlsaXBwZSBNYXRoaWV1LURhdWTDqSA8cGhpbG1kQG9zcy5xdWFsY29tbS5jb20+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBt
YWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
