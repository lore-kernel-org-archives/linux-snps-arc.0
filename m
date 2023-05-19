Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FE4C77B7A
	for <linux-snps-arc@archiver.kernel.org>; Fri, 19 May 2023 08:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L+vUK1Th2ZloJ+u0xX22s516rnVOiL7mmL0Sv47BV48=; b=TLtvXHh0dXo+QV
	DmEnHlF3/mEJhQzJm5H3iXvozBEz7yHXnWVVcvnnt7r9lpbY6V4iU15QuCZkvCnPfnFLekKJX7qQ/
	VR5hQOlZ89QO09hOp6jBf7q5f2gcx62oy9MIKmSnX7dgHcH5fSj8ltnaKpov9bdPF/7KqLbyQScOZ
	9przLe4JCBHxY+6oKVO8WpJGqAMvUQfWhyp6CTRnNWUPcqnD7oPFgG4/U8xd4P7c9iuwqbG022gND
	CTmjNmzRlG7rcqqQr1oAsQCxYtdoJGOwHR8UPjAftd/gE7CaSotOCkmU583aOngYAAAro66GJ8jMu
	HewYst5Mi0r992A12mLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzv8g-00FStB-2t;
	Fri, 19 May 2023 08:07:02 +0000
Received: from mail.corrib.pl ([185.58.226.145])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzv8d-00FSr5-03
	for linux-snps-arc@lists.infradead.org;
	Fri, 19 May 2023 08:07:01 +0000
Received: by mail.corrib.pl (Postfix, from userid 1001)
	id 20719A3EB2; Fri, 19 May 2023 09:06:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=corrib.pl; s=mail;
	t=1684483574; bh=85MOfYTjIHwki6Ys5IeFKzEzX5V7umZoL3TytLG0W/k=;
	h=Date:From:To:Subject:From;
	b=D8IxnftzPT4zlbzU5o7VdpQcKVqJU8yIEYDZJNwPltnJSO9nwB0//HbFrP+Ba8HyS
	 nswIwExwCJbz+fXQm0vONZogCB/CXuichLz1DmecgHqCMoQ5oXKW4ZowCTJKv+tD8x
	 kSbB6v9w8LDeddw8chL8Vbu2FmZku9Y2SnpgDVPyvkqPqxjhyOk+ydjsq8lhee5hpm
	 djkBZ36kj1fUi0kXy+oVxM1IlHDr4uwHVKc4Ncb9Wkg7HAyJkMlxx/xOvk3Ru2olyV
	 aWIh+i4JgiqR5Ooj8HBqfsBorrfGEJ3dBIMVF75FDIZ1KTKFF4IVj0JvW9A4U4rWE6
	 GMmL0kfvkbf+g==
Received: by mail.corrib.pl for <linux-snps-arc@lists.infradead.org>; Fri, 19 May 2023 08:06:12 GMT
Message-ID: <20230519074500-0.1.7b.of57.0.ibh28r0w59@corrib.pl>
Date: Fri, 19 May 2023 08:06:12 GMT
From: "Szczepan Andryszczuk" <szczepan.andryszczuk@corrib.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Faktoring
X-Mailer: mail.corrib.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230519_010659_809389_55EB92BF 
X-CRM114-Status: UNSURE (   1.71  )
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
d2FyYW5jasSZIHNwxYJhdHkuIAoKQ2hjxIUgUGHFhHN0d28gcHJ6ZWFuYWxpem93YcSHIGRvc3TE
mXBuZSBvcGNqZT8KCgpQb3pkcmF3aWFtClN6Y3plcGFuIEFuZHJ5c3pjenVrCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1zbnBzLWFyYyBtYWls
aW5nIGxpc3QKbGludXgtc25wcy1hcmNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXNucHMtYXJjCg==
