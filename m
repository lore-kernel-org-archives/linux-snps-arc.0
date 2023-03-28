Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E7BC761A6
	for <linux-snps-arc@archiver.kernel.org>; Tue, 28 Mar 2023 07:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3MEYLqzPTvQprpiLLJa/pkOBg3VWMsUT7NPdc1077d4=; b=mM5kvZcZ1BLco2
	135V1jo7Ej2s2eLicag2vTsNOqTYZ3M9KYx5XW+R4U6VdyBmu5nzHcnFuZSoTH4sVE6ZabljQ/idY
	ZrViaDavfyOaHUhVPfKwjnUlut0+XqYu7yBDqBoFmujKkSLB/t8OGpyCd/gTABiftBaNwBIt6gEbk
	u+rNedxxSP+jzEHtakdQkbp6B2qIXsREYC5QynUcuDbEZWBpmKROm+wI845OeOAtDgkLu7OJ/K4PG
	fF0HgGn5rGnyRMTJ+vR38l6RkreImtQIU4nbrdz4mcFrtO5/radNxzmf/2lkfnhgkkHH0ZxahkMT/
	Wro7kcgsuqDWVZA6JBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3yz-00DVn9-12;
	Tue, 28 Mar 2023 07:43:05 +0000
Received: from mail.lokoho.com ([217.61.105.98])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph3yw-00DVmD-2q
	for linux-snps-arc@lists.infradead.org;
	Tue, 28 Mar 2023 07:43:04 +0000
Received: by mail.lokoho.com (Postfix, from userid 1001)
	id 2947683FDF; Tue, 28 Mar 2023 08:41:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lokoho.com; s=mail;
	t=1679989381; bh=Z0N5VlX9/JlryGOL5I747Le9USomZJCRNNGRT3LbbKc=;
	h=Date:From:To:Subject:From;
	b=YWtDjDdaxzwuNVJlw+vnB8z9+d6n7RCNiQW36oK5G//06fh+VmrW8YaR8jvrvX51Z
	 dLdl53aeXzlViT6KMVM+UQCvZyVNu4W8IHljEkkxTfI844qe9fypKC/Uz2sug8enLU
	 MQDxjRl+Y+q90xjcJKFEPGiFuVpMjgsfZBBHifnPc8YGreX3RubWt0hG51g4mjAq1y
	 w18ULOrGWkwiQPTG2UzM8rB82dvIrx0oFXv1y2nDr+FuUa723iESwhj/cjL3Xu89VP
	 XQeFEZXIYKpL2AnLA/s7a4l37mdm0pW0nOkofPU0HwFISCGTJwGfqnw2XwI1xeSftq
	 fRhXPo/FP/EoQ==
Received: by mail.lokoho.com for <linux-snps-arc@lists.infradead.org>; Tue, 28 Mar 2023 07:40:50 GMT
Message-ID: <20230328074501-0.1.4x.1mzpe.0.lxfd9oj6b4@lokoho.com>
Date: Tue, 28 Mar 2023 07:40:50 GMT
From: "Adam Charachuta" <adam.charachuta@lokoho.com>
To: <linux-snps-arc@lists.infradead.org>
Subject: =?UTF-8?Q?S=C5=82owa_kluczowe_do_wypozycjonowania?=
X-Mailer: mail.lokoho.com
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_004303_059122_FCCF24E7 
X-CRM114-Status: UNSURE (   1.51  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKemFwb3puYcWCZW0gc2nEmSB6IFBhxYRzdHdhIG9mZXJ0xIUgaSB6IHBy
enlqZW1ub8WbY2nEhSBwcnp5em5hasSZLCDFvGUgcHJ6eWNpxIVnYSB1d2FnxJkgaSB6YWNoxJlj
YSBkbyBkYWxzenljaCByb3ptw7N3LiAKClBvbXnFm2xhxYJlbSwgxbxlIG1vxbxlIG3Ds2fFgmJ5
bSBtaWXEhyBzd8OzaiB3a8WCYWQgdyBQYcWEc3R3YSByb3p3w7NqIGkgcG9tw7NjIGRvdHJ6ZcSH
IHogdMSFIG9mZXJ0xIUgZG8gd2nEmWtzemVnbyBncm9uYSBvZGJpb3Jjw7N3LiBQb3p5Y2pvbnVq
xJkgc3Ryb255IHd3dywgZHppxJlraSBjemVtdSBnZW5lcnVqxIUgxZt3aWV0bnkgcnVjaCB3IHNp
ZWNpLgoKTW/FvGVteSBwb3Jvem1hd2lhxIcgdyBuYWpibGnFvHN6eW0gY3phc2llPwoKClBvemRy
YXdpYW0KQWRhbSBDaGFyYWNodXRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5nIGxpc3QKbGludXgtc25wcy1hcmNA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
