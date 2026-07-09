Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74108C44506
	for <linux-snps-arc@archiver.kernel.org>; Thu,  9 Jul 2026 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8y1v5dWir1frfJEpblHy2lqdV8ZvFta10O/v8fhUK8=; b=v3ielSTs2d7OhC
	8tq8OknyXQFvWorHM5A5hyM2yKAUjM7+RALnJFSglk8nbOjTgFV9SUxCk1DT0R7GxfpMggjDzZlob
	wzI1CP5+r3MPpT0K8d6eSm7Dtr6hGkLkasBurLBoTOEoxFZCgASq3cQNFOrB8JOPQbwcJKWNv+xf7
	Dttf8SEFIEnP9gaNpVjSwx+kxcHwObLr5Lg9M4wV1WFGpuNuEl8vdNFPZosBeFeajseuKqhk76Dad
	jDeQcGgZW6KO59FyYDOCNuYmsLRcuaWh/O9m4ChQUGmkDq9c9bDNASc6DStla3XmTh/Co2GTKvD3C
	QBOAKMbBKrZ5MoyazqKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmpw-000000029SJ-0uM4;
	Thu, 09 Jul 2026 11:22:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whmps-000000029Qd-3M99
	for linux-snps-arc@lists.infradead.org;
	Thu, 09 Jul 2026 11:22:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669AxFGZ1396598
	for <linux-snps-arc@lists.infradead.org>; Thu, 9 Jul 2026 11:22:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=; b=jTI7fkXQl7cmfY8u
	/6bNS+Fwu0N0JYJjqKlpNE/bUkl2mhzeMCIy9YTKs/eoShIUpl8OQCJgxUcCe1Qs
	3cJw4qK9vv+hDmJX2IozRyra6X37WE8v8Vxl6bxaUL0j5/MLQKzhvIKs34reKXrh
	QWs1Vb41u8wIG/o9knrL4GgKq2/ZBNYGTwPnHTuT5u7jJ3EMLnaiRdEBXGlLErlS
	QMBDjPbvcSMQgesyK7qkf9Xbt4GVvlCDF7pU0Ep4e6tiqGpO14UiKVK+WJIifgMb
	eFDVUlYtLgbk+5e07s9PeDWnBLvsQTPHVnHxEKk6PFxWS/VH6saUNZqOsHQv410+
	3wCVHw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fa55vhkdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 11:22:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1eb52e1fso14289121cf.0
        for <linux-snps-arc@lists.infradead.org>; Thu, 09 Jul 2026 04:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783596150; x=1784200950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=;
        b=B9b6LhShy8NFKbrYlFawzpA9BW5sL3WZIaor3JjJN5dijFUSLMn4TTHJBumJ1jHmLB
         4pkeQ3NABLEWGRyxm0d4IuZnWvzE5LtJYPUfbihACAZon1Z6AqGPttvlnU0QV9H5jHNN
         RIgLUe2B8o3Qgk0ROk8+MybzDAzgqFINgGSsz7yrr5hsqLqLUMxNUD9C1oElwqIAfvxM
         JleHAL9jT8ewb18K92fVCE3GT20YSxSVCK8zdsIUGJip5Lu8rf6fxnmixj40lGvhqq/X
         UNkXjhP2l3bG069E9FgKnVGCDin6v52/TCUh7BwYIHk8ih237Y0IfkUzecjrUdtEiBkG
         HOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783596150; x=1784200950;
        h=content-transfer-encoding:content-type:in-reply-to:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GMTUKuNW7nHEjTmJYQtVLsm+lxP07KtZQHvvJ99eHNs=;
        b=OMPLqeieIgovIrOKvmc4zlatCBhwMX40fpqyQRCXkZA/DYeFO7QXpxgBu9nGloE2J/
         HMiLfQm8Tp16w4FW33FdNbB6ymlpTmOoQU209Qog/bDyl5Kh0IrchBf5nk0Ft3bzIFpe
         8eDBOrPxeEKxzmAr6qF1lylEZG/abMRLzXerjpK9NEakUP0bQSGEWfFf32kXEmMndvuS
         3HJJkz/3+QnYX9yklHUvWgnBa9hADpM1+vF3uKKZIbBafF3HQQjbYCFWEwq0q4qQsJ+m
         ANCSc7Bmqnd3GkTuoQ+o16BaYje9XLU6j51hklFTKfkrIoTh3bNX2HOneZjkMXyRybne
         GP2w==
X-Forwarded-Encrypted: i=1; AHgh+Rr/1VBy+DjBaE5G0zPcyZ/sd44iHu6uVTEeRGFusHIkYZipmPjd0jWP5A4KSHCkDwuzB2mL523KKmZM0NLsnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo+X6CNarTf0g8f2I56DgG90aGgOHS5Wxob82WvDG6EhBlFyg7
	cm/06TkhwAlGd+OZJ1dTfuzF7hB3DuAPiu6x5iiFDH2Wqe07usmagawqrpbl96AjRFRyWBvkOLy
	/z/MJfWmiDSoKYHnMV3O9gkg9pYC9T2VxoHQFMqar7yJVCcj9CjQWMGsjQ7iJSZI41XFSkCGy12
	k=
X-Gm-Gg: AfdE7ck5yaevxVTBDomzFXvGhjwaMOSa2j2NZJWiNDx0gGYnpRpRLsA1A0B1jzrnnD0
	T9lHSKcLixvzcEzPvV0l1WBipmYjQo1UqfEiLohsIGblbDV20CdOzu0kyVDw/qDTdUrK5sxysu7
	j6rXZqGRSr+jKR84mQZs3h6qj9gHScO7LRQrSritM/EhCoxf4V8VeUCTip2+0+GOBUierIMDoQw
	fY0EB9ZIewYTpj5NKd03i45BEieZjR1j7jv9q3y1XLQzHLGtQ0hq6Rg6BSlCmCf4EXPhzwKqzy5
	54oCecPSWgYgRR88J1pLXnHR7hRXlq4U5awXfzF4l+RWoCb2bIqFG2yDVRNR2EH/a8srEBXs+G1
	yDS5hHfm/mje7g9O07ODR15+6s+Ak75TQcecgDUYpPD5jbtSBj6fQimKOsXJjKw==
X-Received: by 2002:ac8:58d4:0:b0:51a:8c86:bd4a with SMTP id d75a77b69052e-51c8b407e1cmr74988121cf.71.1783596150615;
        Thu, 09 Jul 2026 04:22:30 -0700 (PDT)
X-Received: by 2002:ac8:58d4:0:b0:51a:8c86:bd4a with SMTP id d75a77b69052e-51c8b407e1cmr74987351cf.71.1783596150195;
        Thu, 09 Jul 2026 04:22:30 -0700 (PDT)
Received: from [192.168.69.219] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e6ccsm50814277f8f.5.2026.07.09.04.22.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 04:22:29 -0700 (PDT)
Message-ID: <ea24e611-91e0-4397-a49c-1493966094f9@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:22:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [patch 10/18] entry: Use syscall number instead of rereading it
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>
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
 <20260707190254.181086755@kernel.org>
 <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
In-Reply-To: <73b82749-2df3-4c12-bc2a-ff7628dc8292@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX1kkXKQphjOIC
 2PO1zclt0JPOUG+9YgMGmwgCUPwfCk7ZvSGxmrKTJDUdfHcCRXRIZL8e6LErcBrDdPnZL2H12I5
 tdaUXPVDDSlFzElua5vCB3WDjPPnF8nXosiWMr1UuE4NIr1SV5+/hdLqwy7ozHE6fndPyLHbDEu
 bNHfQT+9uqMOl2zqvDo5F3jwFp2/UqdpkNxQbFMz9DLbVXtF6Z81Cdy2Fu3tcoOPH1cXjmpWnSw
 GqlEGcWGPAMa52HB9vN/SNli6hxTEagfIn6DwMLbiTMJLjRbCpzFfQZw3E5sYXrdQjq38Rfkcfx
 94XdJhlU+SFrLFKMDeQwVYtayvOyzT+zBR8QuMR62gagmtf2fWlyI6ULm3O8gP06cA+S9Io8o0r
 lqdC44WPaAq7e71ET7OvfDVmg01/pM8ZB2QZwJUFOw6fRo+wgmEBzxJeeCn4gZTk3r6/H83jDHp
 xb+5XJaHXCR5IRAxS2g==
X-Authority-Analysis: v=2.4 cv=KfDidwYD c=1 sm=1 tr=0 ts=6a4f8477 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=4s3hRJSeHn4rkQlkrse1kQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1tSEMpTH9XP_W59IOagA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDEwOCBTYWx0ZWRfX+5xENnUgZCqA
 RDB5Mv1JBj8FJh6wl2Ig/nXU5Ns8RrLxAs6W+IW5aLIUs74paKcjCJLvUjTRjMPkoteIuZjMhvy
 bHFKdCGuN1ao0Gg31QUSs90AUDuIq74=
X-Proofpoint-ORIG-GUID: 2b6vEMzHuj_82rkf1R2-7W3WAzXz9tlg
X-Proofpoint-GUID: 2b6vEMzHuj_82rkf1R2-7W3WAzXz9tlg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_02,2026-07-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_042232_836070_8A16A3FD 
X-CRM114-Status: GOOD (  12.07  )
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

T24gOS83LzI2IDEzOjIwLCBQaGlsaXBwZSBNYXRoaWV1LURhdWTDg8KpIHdyb3RlOgo+IE9uIDcv
Ny8yNiAyMTowNiwgVGhvbWFzIEdsZWl4bmVyIHdyb3RlOgo+PiByc2VxX3N5c2NhbGxfZW50ZXJf
d29yaygpIGlzIGludm9rZWQgYmVmb3JlIHRoZSBzeXNjYWxsIG51bWJlciBjYW4gYmUKPj4gbW9k
aWZpZWQuIFNvIHRoZXJlIGlzIG5vIHBvaW50IGluIHJlcmVhZGluZyBpdCBmcm9tIHB0X3JlZ3Mu
Cj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBHbGVpeG5lciA8dGdseEBrZXJuZWwub3JnPgo+
PiAtLS0KPj4gwqAgaW5jbHVkZS9saW51eC9lbnRyeS1jb21tb24uaCB8wqDCoMKgIDkgKysrKyst
LS0tCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpSZXZpZXdlZC1ieTogUGhpbGlwcGUgTWF0aGlldS1EYXVkw6kgPHBoaWxtZEBvc3MucXVhbGNv
bW0uY29tPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1zbnBzLWFyY0BsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
c25wcy1hcmMK
