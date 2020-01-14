Return-Path: <SRS0=v1Oz=3D=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E90C33C9E
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 23:50:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D534F2075B
	for <linux-snps-arc@archiver.kernel.org>; Tue, 14 Jan 2020 23:50:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YwsssAxR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="aagKWh0A";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="HP65Ry1L"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D534F2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0eYicHYlst56Qe9P3Dw7HRAoPam5tjEXDArYcZjlMw=; b=YwsssAxRjKPPOr
	wd90QCYN71zsGExe8G+TiSm5Vy343JilcyZmUNpm6WUBKRiTitpc4bVPWqv+2Av8sJzC/wgJTXGls
	oPYvzP4br3v7An9qWSWyOkS1LNUC+cP3vFVhWNSBLnlfMo7S4o7/cK3FwpdWlCyGK6O15jCB3t+s+
	5X+eENb6SvrWbncAw3EhN1n0kWQX8ePHMIbFx7hFCrb+u12D+jqb+D4yGX5UmC6QAe4+vtLMRy3vN
	yCQlCzd86TwwiiPvyag8/PCJ0Hpcr49ut53vmD9SQAOPrVW1JQ9yUHgbxe1EqFOekiKTbxKtzqMOn
	RG6OevpjfZMnPuf66qPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irVwt-0008LO-UB; Tue, 14 Jan 2020 23:50:15 +0000
Received: from sv2-smtprelay2.synopsys.com ([149.117.73.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irVwq-0008Ky-TG
 for linux-snps-arc@lists.infradead.org; Tue, 14 Jan 2020 23:50:14 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id BD91C404FC;
 Tue, 14 Jan 2020 23:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1579045812; bh=z+389U6O/mZIPsvEFJIF5S0f/hCqiLd33HgwfAQoWyE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=aagKWh0AmQqrs8xQfLaaEMaBgdstsqETHJ2HWSXM7A0zIjjDMNoddyWTYO6M37RPU
 wDRdYOz+xlQ9NFfPvkd0GCuesyKI7NOL7Ua+wTIp2mF9OyIiLVVXaNDe063kiMawr2
 12AwILHO6ovYjfPQXJ8ZGEo91kHbHW1U+wB86qna4Cny3eWTZUp1ulAyRpyLX6w58l
 Zu9g6OpuF0tOXbqcXGIrdmr6Q0HZfAD8Ok9IpNQ9SsLAVe5ImZuAmgU8WOQabM+LiD
 2QYtqTkjocDQnGxLloXR57KoYkhRiQpE5zmLcuFBTEORZeJ22NLg7srLKP7n5QeHEo
 nSiu2QT23bA/A==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 6F22AA008A;
 Tue, 14 Jan 2020 23:50:06 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.200.27.51) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Tue, 14 Jan 2020 15:49:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.200.27.51) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Tue, 14 Jan 2020 15:49:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l1Y9MTKCs7Ar8IELvQZ9rtPBX3/v9H/V+q4c7jBE3dij3tM8KnOiAlnazUC0vyRsWLuWx+QeHfudonV20AiRkHQJQGZ8sSqnFCTxbRA5hRjcQxpZY7+w4OttafUB/BaIKBHHbMc01ekiKAEz1UOwzwVM+lARCsKS+ZVuGoopbo4TX9bZErlFjpLiWED7Pgyh92HBb+6Hy6Hw5ET+YRzJ138PX9hWa2X7bjOYncv4+e9UnOatv1Qb+Ltusl/GW8OQBxlwVQW9i0wG29kIYKpP5RQ7IRxNJ3Pvk0d6ynuPXd3N6ebX9xmT1+UceSqr/fjBXugYJFRpUr43aih8vywfpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+389U6O/mZIPsvEFJIF5S0f/hCqiLd33HgwfAQoWyE=;
 b=is0q40fAEMhcbqXzcqX0Pe8MQcVs+3ISCAeTFtEnkMDlEy5Uaqv0mOKXwP14Nawg9AMYjN36cWkzQuV/o2shGSO7f7bkilT+tjKLzxMfv7Hilz56IrztD7SqG37gqKdkxFZ1yoYqz2wFC5ADClOLnzPHN6ZqPQOw5tRD+ZDTPAJBisw07g3rm4mWm+YP+USVtjMEZK+f/2wGOlb+n37P0S/KnrP9GTlRphC7g32+/cwbmtPqLZHbEBdrJgeUq0LF5u5rxnho2vMio58CngdFRPJSLNW21MIDBLh/MwholJJfQ3cnVtzSjZi+ueVHffbdnq58YyyIUQ4RKkW5foSRIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z+389U6O/mZIPsvEFJIF5S0f/hCqiLd33HgwfAQoWyE=;
 b=HP65Ry1LwEyJffoodJ+zjqWTD36xq6XxkJ2dzzRk6WAe9WzT6kAzfNiRZYkmBb8G0MmxSSsd9+tlb23rir63c6doq4MkGK53N7mAmFnWbD2ED8+Xl0cd0LgRx7rIxqU/hvT+4TEhhdvuyFB9bOm3/um0DZrpaEtJuIPZ8gOfxz0=
Received: from BYAPR12MB3592.namprd12.prod.outlook.com (20.178.54.89) by
 BYAPR12MB2870.namprd12.prod.outlook.com (20.179.90.211) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.18; Tue, 14 Jan 2020 23:49:51 +0000
Received: from BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333]) by BYAPR12MB3592.namprd12.prod.outlook.com
 ([fe80::39a1:22ee:7030:8333%6]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 23:49:51 +0000
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
To: "gcc-patches@gcc.gnu.org" <gcc-patches@gcc.gnu.org>
Subject: Re: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
 comparisons
Thread-Topic: [PATCH] PR 92846: [ARC] generate signaling FDCMPF for hard float
 comparisons
Thread-Index: AQHVrsNTrzsWmijS+E6tvVh7KNVZ4KfrDRaA
Date: Tue, 14 Jan 2020 23:49:51 +0000
Message-ID: <7264f71a-9a6b-54aa-495f-04cc8702facb@synopsys.com>
References: <20191209190218.20544-1-vgupta@synopsys.com>
In-Reply-To: <20191209190218.20544-1-vgupta@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vgupta@synopsys.com; 
x-originating-ip: [149.117.75.13]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f81d8fd1-7c3e-494d-50cc-08d7994c72b8
x-ms-traffictypediagnostic: BYAPR12MB2870:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB2870F2F5E4AC8AD11539848CB6340@BYAPR12MB2870.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(346002)(39860400002)(136003)(396003)(366004)(189003)(199004)(4744005)(71200400001)(2906002)(6512007)(4326008)(66556008)(66946007)(64756008)(66476007)(66446008)(6916009)(76116006)(31686004)(53546011)(54906003)(6506007)(478600001)(31696002)(316002)(8936002)(2616005)(186003)(86362001)(26005)(81156014)(6486002)(81166006)(5660300002)(8676002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR12MB2870;
 H:BYAPR12MB3592.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ioNUmp39LZ3aBmKK2SOYyaoDekW7wPxGxENZVwULptLcigAHANjZm64YJzsRYY19R6ea+byxwiMqtExGYW4jLVvrx+d0Rc6k7wVKZlmDwBFUQEu8KbbCQB9NTWyxW5Smg7PsAxtu1tEwDQ1lZoW5+JkP1/xId580ilZAWmNQgSZmTIaHbuQvAPGmA1nZFK9SFIPAE5cNpa9KurS2E6FVaqJec4lkydPguLF5jXh5tjHbpPleQOlkfmgzk6XuUkpwegzGjWLOh0fm6yhss4xBJzlrW/3XnXTY8rclGxOYYEATomYoS8mkfyWR+nTikWtYdsJujUpTyMwihdaxVpUQhbfFngHgf/WwPp/22eaL3tebr3wU6gxjo4eTtjz4VXj83b1VfEh86vzhDfOneBXILL4jMyZzqeGaD63b5Qm8zdH7YA3wQV+4Uu6AWWfEQYS+
Content-ID: <C731AE3D0040AE4289C53867C220B6E5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f81d8fd1-7c3e-494d-50cc-08d7994c72b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 23:49:51.6541 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DBpxVv7bNr7EUhOJEm/hVxb9rUQCJaNiDA+b1jERbfulfYgNISxN06ASJbC8VUW+CtaeHEkTdmVL+4I5Z7QwZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2870
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200114_155013_004179_7919386C 
X-CRM114-Status: GOOD (  10.29  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "andrew.burgess@embecosm.com" <andrew.burgess@embecosm.com>,
 Claudiu Zissulescu <Claudiu.Zissulescu@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 12/9/19 11:02 AM, Vineet Gupta wrote:
> ARC gcc generates FDCMP instructions which raises Invalid operation for
> signaling NaN only. This causes glibc iseqsig() primitives to fail (in
> the current ongoing glibc port to ARC)
>
> So split up the hard float compares into two categories and for unordered
> compares generate the FDCMPF instruction (vs. FDCMP) which raises exception
> for either NaNs.
>
> With this fix testsuite/gcc.dg/torture/pr52451.c passes for ARC.
>
> Also passes 6 additional tests in glibc testsuite (test*iseqsig) and no
> regressions

Can this be backported to gcc-9 please ?
glibc testing uses gcc-9

Thx,
-Vineet

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
