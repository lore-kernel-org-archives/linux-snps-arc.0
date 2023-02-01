Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C7BC38142
	for <linux-snps-arc@archiver.kernel.org>; Wed,  1 Feb 2023 09:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HV2UAZ46ME1b4BkaDeq65/pr0NgdbnBDMYKGzeCcIww=; b=k9Me8Sfh11ZKrp
	176UUAPRbM1ak+uDYt2I+aD5zR9ky06Z5SHpMPwFRgI2RPN1NfL0ERyGrE4qkpF8bh4/9rHI1iv5T
	2we+5kA+F5kq+iO9nFd5Mi2hkzY+onpdH6DVHN0FvqwNV6/zgrLDA4dF27v2WIZ+KxsZKtAmQfvCJ
	S2yMD64dh+3PauyF7ArxtRrhIY/sDmoPUTFHo2sqQUaYVx7/y7saJXSPT4vIywZM7V1mYYtOhf/aA
	Xzh3pGrEgoBWBim1nWyxLUgmipxfYM80rJrJCNwv5erLK1ZyOnfhdHrwrT75Iho1qqlzZ2HLKrSxO
	mHC1fIuQmWvQuOlV20ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9Ds-00AzAL-As; Wed, 01 Feb 2023 09:16:08 +0000
Received: from mail.corrib.pl ([185.58.226.145])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN9Dp-00Az9Z-Vv
	for linux-snps-arc@lists.infradead.org; Wed, 01 Feb 2023 09:16:07 +0000
Received: by mail.corrib.pl (Postfix, from userid 1001)
	id D962FA4348; Wed,  1 Feb 2023 09:07:01 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corrib.pl; s=mail;
	t=1675242446; bh=X6IEpSISwJiYlJ3uA866lskXve3r+4o2hf4z7VM6m5o=;
	h=Date:From:To:Subject:From;
	b=Kmg+WUe88xeQ+OYyosfFNJYt6XbEPMypv7YBkhDgEONnRqDk3n+cbMEP8ItHCRbsS
	 Q8mmH4/75vHEKtPB/kqrE4Md9HW76fFaQJzifRE+mn++NE5426qiMRv0wMUloJKbVf
	 w2MurAC21jP2OdCjA2B5XB0ny3/A2sgQGOVUqdE0GmdiGjxzvQw5C0zKWMGtNogAtb
	 gWWWZEXr/V+bSIziNntolMj4sDsCvbhaxHJjj9bElstov5Aows6PO/hX7ckjtNpzTK
	 dlZYUw3CjMxpwX0Maum5ONWTKpChoAVWX7EtFv8NavDzTEDKrywG301hWxToBYYBtB
	 olnlhmmivrfkQ==
Received: by mail.corrib.pl for <linux-snps-arc@lists.infradead.org>; Wed,  1 Feb 2023 09:06:19 GMT
Message-ID: <20230201074500-0.1.58.fiir.0.eng38qwqp3@corrib.pl>
Date: Wed,  1 Feb 2023 09:06:19 GMT
From: =?UTF-8?Q?"Szczepan_Kie=C5=82basa"?= <szczepan.kielbasa@corrib.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Faktoring
X-Mailer: mail.corrib.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_011606_164394_8E940DF2 
X-CRM114-Status: UNSURE (   1.83  )
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

RHppZcWEIGRvYnJ5LAoKcm96d2HFvGFsaSBQYcWEc3R3byB3eWLDs3IgZmluYW5zb3dhbmlhLCBr
dMOzcmUgc3BlxYJuaSBwb3RyemVieSBmaXJteSwgemFwZXduaWFqxIVjIG5hdHljaG1pYXN0b3d5
IGRvc3TEmXAgZG8gZ290w7N3a2ksIGJleiB6YsSZZG55Y2ggcHJ6ZXN0b2rDs3c/IAoKUHJ6eWdv
dG93YWxpxZtteSByb3p3acSFemFuaWEgZmFrdG9yaW5nb3dlIGRvcGFzb3dhbmUgZG8gUGHFhHN0
d2EgYnJhbsW8eSBpIHdpZWxrb8WbY2kgZmlybXksIGR6acSZa2kga3TDs3J5bSwgbmllIG11c3rE
hSBQYcWEc3R3byBtYXJ0d2nEhyBzacSZIG8gbmlld3lwxYJhY2Fsbm/Fm8SHIGtvbnRyYWhlbnTD
s3csIHBvbmlld2HFvCB0cmFuc2FrY2plIHPEhSB6YWJlenBpZWN6b25lIGkgcG9zaWFkYWrEhSBn
d2FyYW5jasSZIHNwxYJhdHkuIApDaGPEhSBQYcWEc3R3byBwcnplYW5hbGl6b3dhxIcgZG9zdMSZ
cG5lIG9wY2plPwoKClBvemRyYXdpYW0KU3pjemVwYW4gS2llxYJiYXNhCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWlsaW5n
IGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
