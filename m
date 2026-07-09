Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07FEC44506
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kdMVByhvl+enXLSGDwn3loa0G8Ale2ROtsGvSc+gyE=; b=HRvkQiQMsZlmP8
	LSUgcaLpUwh6Ghe7BJoyZ45iVSBsOkZMOhKfwhTc17BSTlqAyVQvqGRTaunIbMgFN5TJOq2L4Z5pt
	tSVUe/EEAKaUImBNC4GE+KSqxo1GzTETt3W7lY3dEYDK5ypyBTWPKtO8WhSa7K+I9n03boPQKzsUn
	OiJ8IaoU6eOg3XFL3HAA6yde5mwvYiXWKP+GnRKYiJRzA0IZBCdGwgzv2emc+hLatZ+70cZkOV5Cg
	CcyfYq49KWfFExARC4qThe6SWcT/SsZYdaouCZEwhpohi2KrbEfJPNc8iA7JeYXqmt1fWTw37kKZS
	/dPX8jfhxTJawgJRKosg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmkv-000000027yi-2SSy;
	Thu, 09 Jul 2026 11:17:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmks-000000027wV-2ncd
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 11:17:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669Ax4e21470725
	for <linux-snps-arc@lists.infradead.org>; Thu, 9 Jul 2026 11:17:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6mSNoqY3wyokI6LMIu3gKte85FSyTicRshSy0RusydY=; b=L5+SzP63bgPAWhp4
	W0cUVg2l9n9I+4k0Akz43rpejx4oS0/IbbWAmLMXE7C9F37E36sY/GsXk3zuJt0e
	7WRl8xWn74pDgWLAKB7VqpUweKGfDHpjZadrDE/thxVaWuDjHJ729famrINqKMDx
	0upb87A5cv2e3e9cOgTo/VDABpH4Tf/6q96s0WSa2IFCTqdWIxx3GVEJhdklhdir
	gMzNGoVv54cFMR8lTrj5sNzMMQDcUrBjV8bPTBpznG6YMJOrkgy1v18t2RPVEfx/
	2v3dDdCotvg9oshrPidheW6ip0HZ0YECDQHkCxRsQPUi1HLjdw3FRE6oVFrVR41W
	qvGWIw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4u3gcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:17:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c075c1e25so8067331cf.3
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 04:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783595841; x=1784200641; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6mSNoqY3wyokI6LMIu3gKte85FSyTicRshSy0RusydY=;
        b=AefqBe/5MSqmtGKVRmMQcKqlhluRSXcwJY1rMF4+kHMFAKkhJpBiXFJ5qIf+y77ses
         4pQoce9Sg3Vq2J9iuWXxZ0Jye9DaWCvoLOVe/+OygS1d0V1cqZA6gNlmPQk020tEzbvK
         ZHfxXuS8caOUsCh+rOnLtuX9wI+qKzrA0agSMprRi0mANZGlHA8mUK/f1fswXhaOzYj+
         iziXv6GGW7phSr2jDXliACHazNc1dIp+/kAeH+M4Mrbp6asAA3JaXsg0GzEH7QATc0Kj
         o+dmGYFxg9YAfsAgUtCnhjBgTMR8EEzdG2BViSSSvcqRc/Q1/1OgOd4XToPyQsYlaib+
         +J3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783595841; x=1784200641;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6mSNoqY3wyokI6LMIu3gKte85FSyTicRshSy0RusydY=;
        b=IycrNslCpNFC0ObB+I7Erf8QMMBfESlcAYD6+P7EX/4K57w1x9Sp0qPhhppU+QaHmt
         fmHEDgUTIyhuRxneWYguKvuIV6AVj6WWQoLfpDyRdyithoDVdtr2QM9tLfKQTwAKr1Fw
         uQoMqNgL2cO0TqA9pidgA2dm74xlTfmUcaNQURwMHqc65eqU1QvBRVlgHTzWHGHqUWuV
         13iLVtXpwtRdLUfO8lsD/llcnna3Eee7fkB6CrXO2MysPQCE/8kHP5GXMcNdVWO2qeJC
         JO6sWD6LtU49r3CTdYh/0TNmAB9necD2gg72dFQaXelQDXlTY2wwFY5FHhwkm6lQheDx
         UoNg==
X-Forwarded-Encrypted: i=1; AHgh+Ro7uAwvDgQObV1e9jZY7zXtw5uZ52q0ROhBBVbX5rKd90ZX1HZZABOhIAeCVshyVX6HviiLUDfUCCcsxTMF9Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy737B0/Ta3L6JAQ7OvIclB3aGtBpB0v489UgFyJEZ/0kA/mJn
	BF1iVqTMqlMhdjD86neCGJTZCJpLvcw33UToZNcUXfDL1atTJYjPXUZTDhnpQpUN8hqwkOc6Pra
	b/6XVnr4KZZTTDGX1YpusLA/gy+0mgVnm6pQcRZfgGnJz5RGlgq/cFuLB9YiAIsOVYX+HxiWq7z
	Y=
X-Gm-Gg: AfdE7cm8rQziG48Tdir9RSUTXt0dPO0ZFvZO4adx1m+AEQYj016yKSSY2lINqa5f2p8
	5Yb1ExaJVvv9n4y2p/xJSCr8DPRC9ny2LU5YtgNG+EJrg8b1QKWFyY/R3pDguOBwq/vS1rAr0XX
	NlRZyrm/RxImosAcbPapISPdmkW+8ISSXQtXy8lCS/2F3wpoKfFvCyeEJ1+1YxsOthNZJK/3POQ
	ztX2heYFoEBMW+eYMuWds1pGkW9YkbtqUUkvLO06kLQdklkSkFpzovZnzl+nucpMQSfbT+mw/xw
	SwC/cDsOjMKJdfTr5qZZfSoMxXTMDi6b8157yJyRDm7gCMmUYah2wUk552GqYL3ZbVDk3it46Kb
	LFkGvNCryaqOgZPHQQDNYoxKmrbqR3sXOde4EQFInSxL0f61U2Tgg4vKtyGeMig==
X-Received: by 2002:a05:622a:c86:b0:51c:7b11:41b2 with SMTP id d75a77b69052e-51c8b51c97cmr72542121cf.78.1783595841198;
        Thu, 09 Jul 2026 04:17:21 -0700 (PDT)
X-Received: by 2002:a05:622a:c86:b0:51c:7b11:41b2 with SMTP id d75a77b69052e-51c8b51c97cmr72541381cf.78.1783595840774;
        Thu, 09 Jul 2026 04:17:20 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6cccfdsm54034235e9.1.2026.07.09.04.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:17:20 -0700 (PDT)
Message-ID: <8d15c107-30b1-48df-9e69-a7e8520f4e36@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:17:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 07/18] s390/syscall: Use
 enter_from_user_mode_randomize_stack()
Content-Language: en-US
To: Jinjie Ruan <ruanjinjie@huawei.com>, Thomas Gleixner <tglx@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
        Sven Schnelle
 <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Kees Cook <kees@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        loongarch@lists.linux.dev, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
        x86@kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
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
 <20260707190254.030598804@kernel.org>
 <499eca86-8def-4044-8b69-8f290528e10f@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
In-Reply-To: <499eca86-8def-4044-8b69-8f290528e10f@huawei.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfXzUzsiP2LE8Qf
 Kih60cACZaW9KPYjvgLCmH4N4g4tLuH9I4yEyGOaha+wefuRnL6OM2m7RwruqjTcTSrU3fSLVfY
 61bsuK7j6yVh8GFMkOio0KGQVLa7spY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX2KyfyJ09j0/g
 KsMIGg4U9a+j5Z4jE8VmM7nAnuQT5VrYDs2u1d0RM1iWOnF0GF3iodijdcFzfTNrBqb2eoRErbV
 XZWQ1TS96lpFWau1k/coagdXBARB+FlA+ZHC5Jji1QouLhG1mA6X3uAP/eiSMm6tvVvCO4entZW
 Q4gAqabguWolXvE35BO/gkWpCZ17GzYjQLKkQj9cy6AOOvm+d9gpALub10WaGcjViEcqN1l93oc
 mxuTM2r5LHonmUOmZksyMM6qkYRALJvNq7R0mVpn/lGcvQCK5sqAwKckII3AaFgzowDOkb+qYCC
 ta5If2WG7aPlJkEqdTWoZKQFZRE2l8E5pUgWtRxgbsFIx3yM1CFK6TTNKtOWnThWpBzlhMF8j2k
 45yBeEA3uq7ODVZPTRndBbtsyl++8sqSnFFQJ3oZjGde3mcASNLqol0HSoCKyddjCCbpWHl9Z0+
 ZzARJ0hzue0yZwSGHRg==
X-Proofpoint-GUID: blmmbOPdFt53JZZGbcpy2juqk8Mbe7jV
X-Proofpoint-ORIG-GUID: blmmbOPdFt53JZZGbcpy2juqk8Mbe7jV
X-Authority-Analysis: v=2.4 cv=QoVuG1yd c=1 sm=1 tr=0 ts=6a4f8342 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=EUspDBNiAAAA:8 a=LfsA7Cq2GQzuzbZ-N0YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_041722_708650_01464871 
X-CRM114-Status: GOOD (  14.58  )
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

T24gOS83LzI2IDA0OjQ2LCBKaW5qaWUgUnVhbiB3cm90ZToKPiAKPiAKPiBPbiA3LzgvMjAyNiAz
OjA2IEFNLCBUaG9tYXMgR2xlaXhuZXIgd3JvdGU6Cj4+IGVudGVyX2Zyb21fdXNlcl9tb2RlX3Jh
bmRvbWl6ZV9zdGFjaygpIHJlcGxhY2VzIGVudGVyX2Zyb21fdXNlcl9tb2RlKCkgYW5kCj4+IHRo
ZSBzdWJzZXF1ZW50IGludm9jYXRpb24gb2YgYWRkX3JhbmRvbV9rc3RhY2tfb2Zmc2V0X2lycXNv
ZmYoKS4KPj4KPj4gQXMgYSBib251cyB0aGlzIGF2b2lkcyB0aGUgb3ZlcmhlYWQgb2YgZ2V0L3B1
dF9jcHVfdmFyKCkgaW4KPj4gYWRkX3JhbmRvbV9rc3RhY2tfb2Zmc2V0KCkuCj4+Cj4+IE5vIGZ1
bmN0aW9uYWwgY2hhbmdlLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRn
bHhAa2VybmVsLm9yZz4KPj4gQ2M6IFN2ZW4gU2NobmVsbGUgPHN2ZW5zQGxpbnV4LmlibS5jb20+
Cj4+IENjOiBsaW51eC1zMzkwQHZnZXIua2VybmVsLm9yZwo+PiAtLS0KPj4gICBhcmNoL3MzOTAv
a2VybmVsL3N5c2NhbGwuYyB8ICAgIDQgKystLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IC0tLSBhL2FyY2gvczM5MC9rZXJuZWwvc3lz
Y2FsbC5jCj4+ICsrKyBiL2FyY2gvczM5MC9rZXJuZWwvc3lzY2FsbC5jCj4+IEBAIC05Nyw4ICs5
Nyw4IEBAIHZvaWQgbm9pbnN0ciBfX2RvX3N5c2NhbGwoc3RydWN0IHB0X3JlZ3MKPj4gICB7Cj4+
ICAgCXVuc2lnbmVkIGxvbmcgbnI7Cj4+ICAgCj4+IC0JZW50ZXJfZnJvbV91c2VyX21vZGUocmVn
cyk7Cj4+IC0JYWRkX3JhbmRvbV9rc3RhY2tfb2Zmc2V0KCk7Cj4+ICsJZW50ZXJfZnJvbV91c2Vy
X21vZGVfcmFuZG9taXplX3N0YWNrKHJlZ3MpOwo+IAo+IFRoZSAjaW5jbHVkZSA8bGludXgvcmFu
ZG9taXplX2tzdGFjay5oPiBjYW4gYmUgcmVtb3ZlZC4KClJldmlld2VkLWJ5OiBQaGlsaXBwZSBN
YXRoaWV1LURhdWTDqSA8cGhpbG1kQG9zcy5xdWFsY29tbS5jb20+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtc25wcy1hcmMgbWFpbGluZyBs
aXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFyYwo=
