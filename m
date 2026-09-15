Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F02C88E75
	for <linux-snps-arc@archiver.kernel.org>; Tue, 15 Sep 2026 22:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/TQvprrRZGG7aqhQ/Gg4fLQ62CBFUzeoWzL15MziyEg=; b=GJLqsmcZ4V9UYF
	VzqPpNxmjsPtd8NpyHe1ANJ2mUnrjdDq7yrBXT+B+Lwj8zqmKIGA09lczIb1UIim/ul2R4TY2EEd0
	7TOajSSDQCb/vg6kY0kfWWI2zU9kmZKV5GPMbJuRmE67f7Xa5Ot/S6nRHPvQjf2rNHaXtyX14eaJS
	M31Jng/CxqfGRgIcoHRmQaA+b9H6nicefFipAHVLA+EHUNSxYojvUZ9mj/zUflZYLhaYT+xe8Opb0
	vxPRIM33KxvoHVcWm7Y+MucbN8i/Q/vidU40mZ/9x8hnNkkluUPgwONlxPxhHDmOyaiElt9kI6K0X
	q6FNhR/y2K+ZoRcXMYZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bX6-0000000804m-1Wck;
	Tue, 15 Sep 2026 22:21:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6bX4-00000008043-0Exp
	for linux-snps-arc@bombadil.infradead.org;
	Tue, 15 Sep 2026 22:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=c/ybMo+L34M57u9pSeT8wJb/c5
	TARKvru6HDBqJIkV+FstRpkMbpr+s86XiXuFIjFWhA1aUXDZLbUA3aeW82k7zNivmoLMcJDTf3D4l
	wx71NrmRgGopjKrVSXfqrhrFGR/RoEU1Ku00v2jfy/J3DzjnoE3V7zgqLok6ft4kxpqAfgYBSDOlk
	9QRqJdzjHUgaZh/syjsZWUVfrbXDQy+DZh26Vu8jIxVY48LSmd/W9CY3siJ6ncXSXY+JcD8hvUEDn
	EAY73/gEeNmB65pfE5NPZR5lw33WFeSsJJlC9t/lwrhVnxIZLcqd6vIjo5izCjmcWke6KLkeeCxJp
	UHAl/1Mw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6bWz-00000007I8i-1JEw
	for linux-snps-arc@lists.infradead.org;
	Tue, 15 Sep 2026 22:21:39 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FLZBRo721736
	for <linux-snps-arc@lists.infradead.org>; Tue, 15 Sep 2026 22:21:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=; b=IV
	/k2TQjkUrsTGpshqW8f1AkLpzgE6WqJLnJXyVNHKYz8mozA+vLQbIOpShvI99Nvk
	BGk11nj45xZQZMebNdo7NiYw/EO7W5wcvHVc8eAkRKtGrNMclkKkbe3unomYvdUd
	vFaT1byqggr1zubtRjDzuTG9pECEQdOzFAiv4kdIU3d7CXM0IsQ27dhrP8NvQBkU
	TlOdMgPnM8h4FF25SXM2n03VFD94RLvjnLlaGSHHxie20ptztZeSDX3B4EelrzMT
	n1DLEJiB1mKEp0dVH3Si7JCiMZpC8ZcIigaByfbQDV2F2ANWVcL1rru5kNRyAlZ9
	ag1DWjYpUlLQQuGalXdA==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9s4m5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-snps-arc@lists.infradead.org>; Tue, 15 Sep 2026 22:21:31 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46509ab0149so6391311fac.2
        for <linux-snps-arc@lists.infradead.org>; Tue, 15 Sep 2026 15:21:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789510891; cv=none;
        d=google.com; s=arc-20260327;
        b=DStIVdxnlZ/bjiXcDE001P9PbMRXttZZLKY4kmQa3scNqHfElkhCzIyrm0L7ogPUu5
         T2lzYTgecOmbdu0U3J4ThFOSBGdRLoH/K5Q1q2S6yrc331rCivHs7EwKV8kvOJcmXYqk
         wzYRoe1ZOVQboRdvnLZpdHQbL98Iy5bWs+qxUk2KQ6JhMTzDKn6FkPLeSpGGCxgELjrr
         9S3FeWd+scc3Hww2ywaiKadNNcPlgOE97i8O1vE2wY2HNR4Q6UtuiSjS+s8cBeJlTC9d
         ZhJhv1uuZC7QanThI8ON4ohS7FwxzT3ANmv8laK9vD2eFvIf6npIYWHck8fjpTN2C/Sw
         BM2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        fh=aKlSgFT29iF0R0YIt3jTjWjkn+e9yP0rYZpYRIpG+xY=;
        b=ocAGeBfH11572se/+oFCOfPd58xxMdFzcp4K/eRfXEnrR/y2xAIE3W/km4JxOt+6/M
         K5laK5VS+R5GW6hnrhcwLAMLbRel00n35KOPb+xNQy7FL/md2DXtx4XNobC/FOzCbIx/
         qxPkeeaRdK/CTeRIr1XWq+C7L1/LgrdXXsxca1Ec5H28igxmv9Vy1e5kATmlQ1ZSlV07
         eSG4NXx5phnQBpU1zKz+nu2Qd6wFntsDKlYk8HDb1BytKyLGpXaL0ahrGls86p2DEqWX
         d1qHnTRz6MaXfs7xZsk5CsF7Ku5AoWVVS5paO9TCnOgvIf9M1kvD4x8KBz32Rt4Wb5KC
         zb9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789510891; x=1790115691; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=FoTYuFy9GrqqNPcs1ZFGImcDmRL5AF9tq00ISMZkXgyjMZso2cbXZu+IbhHuJEU0BS
         VWv/pOAett/QhTdHkSetFnVbD/ogWtyJKXz5277/WTmhKGdLtFY0HcChI704vPTlMNDr
         02xytw1UeSFN0BKquJSAR4ejrsJUyRfI4KIqytyIdzxV1H8h8VtTx9mlIZrOslCPyzj4
         vjeAgEZdkOzDEdReEGEYOZn+0ldFnOsa2SZdaNXUzMaTX9OjXgy8c1NLh6Jvs0vojiuC
         g+pWBU5OW7qvWZoeP0CfWock+ACnTw0fy4IMEsaT9qYGaG1p7uUXs4dgoI3E5AiBuPoh
         r50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789510891; x=1790115691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hnJAniUUz5UpK0eAzqlFlmnyP+PG3E6KxIttKsrRd1w=;
        b=JPP+06n21GTLpukoRqzM4SMQ87Wn2QpBXFsb+189tGDPhHAFj77cmx2bqznIVOrCo6
         tP9sWMVUSNsDj+Q4lTBtB261M/om+L+7JX2ct715F9UPMWIUHfrtpp875TefQa7/5Htf
         OC7ZQ0rf8jR+fg2FTkt3bo8RUZdrjmgRmoo6ZepNTVIodIkVjv4iEl7teiV5qZItHsul
         +S5+fNrHiMwGKs2uhi3AVMlDxFvK7TDK8UGqSDWmC/8Ux43vSGyo023Ic18oVAeKWbxT
         CFT4nIDwsHmGmawoAedASN/i3uBvkRvZrfmz9BOTV20jEhD1vzz3TFyhHlJCAdmycRwi
         2Hgg==
X-Forwarded-Encrypted: i=1; AKwUvBzFNtIoqb8w5xUqz73s2GZnY6jd7RxNXgQJ1CO8wEeTRuse5J+eB7xqaL4BhBa+mFNbqAD3VgMIEwxF1zo5Dw==@lists.infradead.org
X-Gm-Message-State: AFuF++kx0wrSKSADomNVjKzJhjWMQR3YBcLEXvE9f2Yq0Yn0rfvpmU+l
	lFpnFV+a692aSZ1ew5z+Z3hH4fsNu273zfw1MZNg85Q0BGq8LySFm52Nd7AJce4lH9mAFBGUBwq
	pdsFA0WENcufOu4tekiQ28/qpMtHlg34bh+5xxtRKF3IPHjoe8OFleqo2vuATfUulreRrGfYz/2
	vlejSD6hGEz6BoKB9Y4whEnQSXt4x0JJhPH1BwNAO76qOKfAGb/Q==
X-Gm-Gg: AYBFou0ZOdi8UgtFVF8mdynn05IRvX166U68UaFf4NYRDl9CbvTGn8wsp2UVUguJnQn
	ocgX1BXd43RTQxu24Ho2Lb4kRn3UDV5xE5bUThX+ETZYKDNxoORFhf79vZUteyTYelWVJCFmkda
	ktgQ2WylAX6Xjt51tTWp31FNwwIgqMFnY+VhzmeRuk2xjIaexZ6ijiTg6e
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id 586e51a60fabf-4847584c51dmr189768fac.2.1789510890861;
        Tue, 15 Sep 2026 15:21:30 -0700 (PDT)
X-Received: by 2002:a05:6870:30f:b0:45e:2de4:95f1 with SMTP id
 586e51a60fabf-4847584c51dmr189724fac.2.1789510890430; Tue, 15 Sep 2026
 15:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260915-work-fd-reserve-unify-folded-v1-0-4d5217d6b246@kernel.org>
 <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
In-Reply-To: <CAHk-=wjeamU=_RYT9cR3dZJ2N-Teo-N1+aYh7jwhrB=iWXD0cg@mail.gmail.com>
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 15:21:18 -0700
X-Gm-Features: AcwNN1UxxSxAxz0XPK7niSod0Tx_HsUs-C3mKdcqDSaFkh659BGkCorPygYZGHE
Message-ID: <CACSVV028AdnTYa6OKDeoJYCau58uTkKMgEdqTn7crNSV8QZxOA@mail.gmail.com>
Subject: Re: [PATCH RFC POC 00/50] file: handle files on syscall exit
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>, Jann Horn <jannh@google.com>,
        Jan Kara <jack@suse.cz>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>, linux-fsdevel@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Oleg Nesterov <oleg@redhat.com>, linux-alpha@vger.kernel.org,
        linux-snps-arc@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        Jens Axboe <axboe@kernel.dk>, io-uring@vger.kernel.org,
        netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, bpf@vger.kernel.org,
        David Airlie <airlied@redhat.com>, virtualization@lists.linux.dev,
        kvm@vger.kernel.org, kexec@lists.infradead.org,
        linux-hyperv@vger.kernel.org
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aa9c4eb cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8
 a=2Rxv5svHm-zNKBYa0PsA:9 a=QEXdDO2ut3YA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: mkkmZfJ_r9Hz7fnAbrXIMCwnO3kV7H3q
X-Proofpoint-GUID: mkkmZfJ_r9Hz7fnAbrXIMCwnO3kV7H3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfX0ScruvPO9/BS
 XbNgy6YY0pBwL6okrgtUXWeYs+pIYOnqmkEt6JvLMbHcAV0+g/vKCRBxTcpe/3BHIo/KNrpVzIZ
 GoXIzXQEB1/jiUXNy6u0mmoLC8vyUQ/UoCiRhWMi5X1KbJ4DuxSJP6j68+Bpnk788f6pnMtjzMx
 KY62Scx9++VwoxpavyVfPxTPWLRE6vtOPKXIQ+Hq4tDQ7j2WUXEYHvnAYtARHyJs/GBgQxiCiRb
 g8kkgFDP1t48rkfwxwMTQDwU/YJHQgnK3qe+4ZGt4257GKR7QiVSBtHp6l/YbWs3BlPAhT9+3RE
 7vw1Jvov1l4tjGXwAIoNUPUC4r2yfqncHMQOuqdIM3j6ixkIrW7a7qie4+1jUzfx0JojHjRPO+e
 b6IQzIkZWORpz2ZYudPG7bjtc1Rw2DNWeq15jJJq6hOVDHBAw+YwA78CdaEVDEME1mF72yOexo+
 ouRkIoMAoAauacg4a8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDMyNiBTYWx0ZWRfXxYY1+DEgwRYU
 vCFbqPzQrpVgXO9kiBI9wa2dL0I2K5IJ3qZU7lRqKyDwFoUIblHx+QQVAnQXL50HHQRKyWKDRjC
 OLB+u4EosbU/KxtyEw0pji6eNbTg2hg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150326
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_232138_199443_3626EF43 
X-CRM114-Status: GOOD (  19.76  )
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
Reply-To: rob.clark@oss.qualcomm.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTUsIDIwMjYgYXQgOTowMuKAr0FNIExpbnVzIFRvcnZhbGRzCjx0b3J2YWxk
c0BsaW51eC1mb3VuZGF0aW9uLm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIDE1IFNlcHQgMjAyNiBh
dCAwNDozMSwgQ2hyaXN0aWFuIEJyYXVuZXIgPGJyYXVuZXJAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pgo+ID4gVEw7RFIsIHRoaXMgbGV0cyBhcmNoIGNvZGUgaGFuZGxlIGZkIGluc3RhbGwgYW5kIGNs
ZWFudXAuIGZkX3ByZXBhcmUoKQo+ID4gYWxsb2NhdGVzIGEgZGVzY3JpcHRvciBsaWtlIGdldF91
bnVzZWRfZmRfZmxhZ3MoKSBkb2VzIGFuZCByZWNvcmRzIGl0IGluCj4gPiBhIHNsb3Qgb24gdGhl
IHRhc2suIGZkX3N0YWdlKCkgYXR0YWNoZXMgdGhlIGZpbGUgdG8gdGhhdCBzbG90IGFuZAo+ID4g
cmV0dXJucyB0aGUgbnVtYmVyLgo+Cj4gSG9uZXN0bHksIEkgYW0gKm5vdCogYSBmYW4uIEF0IGFs
bC4KPgo+IEkgdGhpbmsgdGhpcyBhZGRzIGNvbXBsZXhpdHkgcmF0aGVyIHRoYW4gcmVtb3Zpbmcg
aXQuCj4KPiBUaGUgZGlmZnN0YXQgdGVsbHMgYSBzdG9yeToKPgo+ID4gIDEwNiBmaWxlcyBjaGFu
Z2VkLCA5NjIgaW5zZXJ0aW9ucygrKSwgODYxIGRlbGV0aW9ucygtKQo+Cj4gaW4gaG93IHRoaXMg
YWRkcyBhIGh1bmRyZWQgbGluZXMgbW9yZSB0aGFuIGl0IGRlbGV0ZXMuCj4KPiBCdXQgdG8gbWFr
ZSB0aGluZ3Mgd29yc2UsIGl0IGFkZHMgdGhlbSBpbiBiYWQgcGxhY2VzOiBsb3ctbGV2ZWwKPiBh
cmNoaXRlY3R1cmUgYXNzZW1ibHkgY29kZS4KPgo+IFRob3NlIGV4dHJhIGxpbmVzIGFyZSAqbm90
KiBtYWtpbmcgY29tcGxpY2F0ZWQgY29kZSBzaW1wbGVyLiBRdWl0ZSB0aGUKPiByZXZlcnNlLiBU
aGV5IGFyZSB0YWtpbmcgZmFpcmx5IHN0cmFpZ2h0Zm9yd2FyZCAianVzdCBkZWFsIHdpdGggZXJy
b3JzCj4gd2l0aCBub3JtYWwgY2xlYW51cCBpbiB0aGUgcGxhY2Ugd2hlcmUgaXQgbWFrZXMgc2Vu
c2UiIGFuZCBtYWtlcyB0aGUKPiAqc3RyYWlnaHRmb3J3YXJkKiBjYXNlIHNpbXBsZXIsIHdoaWxl
IG1ha2luZyB0aGUgYmlnIHBpY3R1cmUgbW9yZQo+IGNvbXBsaWNhdGVkIGFuZCBzdWJ0bGUsIGFu
ZCBhZGRpbmcgbmV3IGNvZGUgdG8gcGxhY2VzIHRoYXQgYXJlIG5vdAo+IHNpbXBsZSBhbmQganVz
dCBibGluZGx5IGRvIHNvbWV0aGlnbiB0aGF0IG1ha2VzIG5vIHNlbnNlIGluIHRoYXQKPiBjb250
ZXh0LgoKV2l0aCBmZCdzIGl0IGlzIG1vcmUgdGhhbiBqdXN0IGFib3V0IGVycm9yIHJvbGxiYWNr
Li4gZXhwb3NpbmcgYW4gZmQKdG8gdXNlcnNwYWNlIG1pZC13YXkgdGhydSBhbiBpb2N0bCBpcyBh
biBlYXN5IHNlY3VyaXR5IGJ1ZyB0byB3cml0ZS4uCgpPVE9ILCAianVzdCB1c2UgRkRfUFJFUEFS
RSgpIC8gZmRfcHVibGlzaCgpIi4uCgpCUiwKLVIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXNucHMtYXJjIG1haWxpbmcgbGlzdApsaW51eC1z
bnBzLWFyY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtc25wcy1hcmMK
